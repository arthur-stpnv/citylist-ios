//
//  City.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import Foundation

struct City: Decodable {
    
    let id: String
    let title: String
    let icon: String
    
    var isFavorite: Bool {
        let favoriteIds = UserDefaultsManager.shared.getFavoriteCitiesIds()
        return favoriteIds.contains(id)
    }
    
    var visitors: [String]?
    var rating: Float?
    
    // MARK: Parcing
    
    enum CodingKeys: String, CodingKey {
        case id, title, icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        icon = try container.decode(String.self, forKey: .icon)
    }
}
