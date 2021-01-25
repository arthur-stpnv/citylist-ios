//
//  UIImageView+LoadImage.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import UIKit

extension UIImageView {
    
    func setImage(url: String) {
        DispatchQueue.global().async { [weak self] in
            guard let imageUrl = URL(string: url), let data = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async { self?.image = UIImage(data: data) }
        }
    }
    
}
