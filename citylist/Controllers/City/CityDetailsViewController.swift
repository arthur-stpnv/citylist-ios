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
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var city: City?
    
    // MARK: Setups
    
    override func setupView() {
        super.setupView()
        
        title = "Details"
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        view.addSubview(ratingLabel)
        
        iconImageView.top(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24)
        iconImageView.left(equalTo: view.leadingAnchor, constant: 24)
        iconImageView.height(equalToConstant: 50)
        iconImageView.width(equalToConstant: 50)
        
        setupData()
    }
    
    private func setupData() {
        guard let city = city else { return }
        iconImageView.setImage(url: city.icon)
    }
    
}
