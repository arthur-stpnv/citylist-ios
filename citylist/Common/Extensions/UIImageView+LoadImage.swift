//
//  UIImageView+LoadImage.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import UIKit

extension UIImageView {
    
    func setImage(url: String, placeholder: UIImage? = nil) {
        guard let imageUrl = URL(string: url), let data = try? Data(contentsOf: imageUrl) else {
            image = placeholder
            return
        }
        
        image = UIImage(data: data)
    }
    
}
