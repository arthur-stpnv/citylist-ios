//
//  CityDetailsViewController.swift
//  citylist
//
//  Created by Arthur Stepanov on 24/01/2021.
//

import UIKit

class CityDetailsViewController: BaseViewController {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var visitorsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blueButton
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(visitorsButtonTouched(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var favoriteButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Like", style: .plain, target: self, action: #selector(favoriteButtonTouched(_:)))
        return button
    }()
    
    var city: City?
    
    // MARK: Setups
    
    override func setupView() {
        super.setupView()
        
        title = "Details"
        navigationItem.rightBarButtonItem = favoriteButton
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        view.addSubview(ratingLabel)
        view.addSubview(visitorsButton)
        
        iconImageView.top(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36)
        iconImageView.centerX(equalTo: view.centerXAnchor)
        iconImageView.height(equalToConstant: 100)
        iconImageView.width(equalToConstant: 100)
        
        titleLabel.top(equalTo: iconImageView.bottomAnchor, constant: 16)
        titleLabel.left(equalTo: view.leadingAnchor, constant: 24)
        titleLabel.right(equalTo: view.trailingAnchor, constant: -24)
        titleLabel.height(equalToConstant: 25)
        
        ratingLabel.top(equalTo: titleLabel.bottomAnchor, constant: 8)
        ratingLabel.left(equalTo: view.leadingAnchor, constant: 24)
        ratingLabel.right(equalTo: view.trailingAnchor, constant: -24)
        ratingLabel.height(equalToConstant: 25)
        
        visitorsButton.left(equalTo: view.leadingAnchor, constant: 24)
        visitorsButton.right(equalTo: view.trailingAnchor, constant: -24)
        visitorsButton.bottom(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        visitorsButton.height(equalToConstant: 50)
        
        visitorsButton.isHidden = true
        
        loadData()
    }
    
    private func setupData() {
        guard let city = city else { return }
        favoriteButton.title = city.isFavorite ? "Unlike" : "Like"
        iconImageView.setImage(url: city.icon)
        titleLabel.text = city.title
        ratingLabel.text = "Rating: \(city.rating ?? 0.0)"
        visitorsButton.setTitle("View visitors (\(city.visitors?.count ?? 0))", for: .normal)
        visitorsButton.isHidden = false
    }
    
    // MARK: Methods
    
    private func loadData() {
        let group = DispatchGroup()
        
        showWaiting()
        
        group.enter()
        NetworkManager.shared.getRating(completion: { [weak self] rating, error in
            guard let rating = rating else {
                self?.hideWaiting()
                self?.showError(error)
                return
            }
            
            self?.city?.rating = rating.rating
            group.leave()
        })
        
        group.enter()
        NetworkManager.shared.getVisitors(completion: { [weak self] visitors, error in
            guard let visitors = visitors else {
                self?.hideWaiting()
                self?.showError(error)
                return
            }
            
            self?.city?.visitors = visitors
            group.leave()
        })
        
        group.notify(queue: .main, execute: { [weak self] in
            self?.hideWaiting()
            self?.setupData()
        })
    }
    
    // MARK: Targets
    
    @objc private func favoriteButtonTouched(_ sender: Any) {
        guard let city = city else { return }
        
        if city.isFavorite {
            favoriteButton.title = "Like"
            UserDefaultsManager.shared.removeFavoriteCity(id: city.id)
            return
        }
        
        favoriteButton.title = "Unlike"
        UserDefaultsManager.shared.addFavoriteCity(id: city.id)
    }
    
    @objc private func visitorsButtonTouched(_ sender: Any) {
        guard let city = city,
              let viewController = storyboard?.instantiateViewController(withIdentifier: "CityVisitorsViewController") as? CityVisitorsViewController
        else { return }
        
        viewController.visitors = city.visitors ?? []
        navigationController?.present(viewController, animated: true)
    }
}
