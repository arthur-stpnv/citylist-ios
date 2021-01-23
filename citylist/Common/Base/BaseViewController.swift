//
//  BaseViewController.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    // MARK: Setups
    
    func setupView() {
        
    }
    
}
