//
//  CityTableViewCell.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Overrides
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        favoriteImageView.image = nil
    }
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.height(equalToConstant: 100)
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(favoriteImageView)
        
        iconImageView.centerY(equalTo: contentView.centerYAnchor)
        iconImageView.left(equalTo: leadingAnchor, constant: 20)
        iconImageView.height(equalToConstant: 50)
        iconImageView.width(equalToConstant: 50)
        
        titleLabel.top(equalTo: contentView.topAnchor)
        titleLabel.left(equalTo: iconImageView.trailingAnchor, constant: 16)
        titleLabel.right(equalTo: favoriteImageView.leadingAnchor, constant: 16)
        titleLabel.bottom(equalTo: contentView.bottomAnchor)
        
        favoriteImageView.centerY(equalTo: contentView.centerYAnchor)
        favoriteImageView.right(equalTo: trailingAnchor, constant: -20)
        favoriteImageView.height(equalToConstant: 30)
        favoriteImageView.width(equalToConstant: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    func configure(with city: City) {
        iconImageView.setImage(url: city.icon)
        titleLabel.text = city.title
        favoriteImageView.image = city.isFavorite ? #imageLiteral(resourceName: "Favorite.Selected") : #imageLiteral(resourceName: "Favorite.Deselected")
    }
}
