//
//  AlertViewController.swift
//  citylist
//
//  Created by Arthur Stepanov on 24/01/2021.
//

import UIKit

class AlertViewController: UIViewController {
    
    private lazy var waitingView: UIView = {
        let view = UIView()
        view.backgroundColor = .waitingBackground
        view.layer.cornerRadius = 10
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .lightGray
        activityIndicator.startAnimating()
        
        view.addSubview(activityIndicator)
        activityIndicator.centerX(equalTo: view.centerXAnchor)
        activityIndicator.centerY(equalTo: view.centerYAnchor)
        
        return view
    }()
    
    private var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first
    }
    
    // MARK: Methods - Alert
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
    func showError(_ error: Error?) {
        showAlert(title: "Error", message: error?.localizedDescription)
    }
    
    // MARK: Methods - Waiting
    
    func showWaiting() {
        guard let keyWindow = keyWindow else { return }
        keyWindow.addSubview(waitingView)
        
        waitingView.centerX(equalTo: keyWindow.centerXAnchor)
        waitingView.centerY(equalTo: keyWindow.centerYAnchor)
        waitingView.height(equalToConstant: 110)
        waitingView.width(equalToConstant: 110)
    }
    
    func hideWaiting() {
        DispatchQueue.main.async { [weak self] in self?.waitingView.removeFromSuperview() }
    }
    
}

