//
//  ListViewController.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import UIKit

class ListViewController: BaseViewController {

    private lazy var contentTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    private lazy var filterButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonTouched(_:)))
        return button
    }()
    
    private var cities = [City]()
    private var filteredCitites = [City]()
    private var isFilterMode = false
    
    // MARK: Setups
    
    override func setupView() {
        super.setupView()
        
        title = "Countries"
        navigationItem.rightBarButtonItem = filterButton
        
        view.addSubview(contentTableView)
        
        contentTableView.top(equalTo: view.safeAreaLayoutGuide.topAnchor)
        contentTableView.left(equalTo: view.leadingAnchor)
        contentTableView.right(equalTo: view.trailingAnchor)
        contentTableView.bottom(equalTo: view.bottomAnchor)
        
        loadData()
    }
    
    // MARK: Methods
    
    private func loadData() {
        showWaiting()
        NetworkManager.shared.loadCities(completion: { [weak self] cityList, error in
            self?.hideWaiting()
            guard let cityList = cityList else {
                self?.showError(error)
                return
            }
            
            self?.cities = cityList
            self?.filteredCitites = cityList
            self?.contentTableView.reloadData()
        })
    }
    
    // MARK: Targets
    
    @objc private func filterButtonTouched(_ sender: Any) {
        isFilterMode = !isFilterMode
        filterButton.title = isFilterMode ? "Clear" : "Filter"
        filteredCitites = isFilterMode ? cities.filter { $0.isFavorite } : cities
        contentTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate -

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCitites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        let item = filteredCitites[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = filteredCitites[indexPath.row]
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "CityDetailsViewController") as? CityDetailsViewController else { return }
        viewController.city = item
        navigationController?.pushViewController(viewController, animated: true)
    }
}
