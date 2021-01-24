//
//  UIView+Constraints.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import UIKit

extension UIView {
    
    func top(equalTo item: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: item, constant: constant).isActive = true
    }
    
    func left(equalTo item: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: item, constant: constant).isActive = true
    }
    
    func right(equalTo item: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: item, constant: constant).isActive = true
    }
    
    func bottom(equalTo item: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: item, constant: constant).isActive = true
    }
    
    func centerX(equalTo item: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: item, constant: constant).isActive = true
    }
    
    func centerY(equalTo item: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: item, constant: constant).isActive = true
    }
    
    func height(equalToConstant constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func width(equalToConstant constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
}
