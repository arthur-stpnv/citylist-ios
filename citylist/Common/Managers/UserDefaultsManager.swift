//
//  UserDefaultsManager.swift
//  citylist
//
//  Created by Arthur Stepanov on 24/01/2021.
//

import Foundation

private enum UserDefaultsKey: String {
    case favoriteCities = "citylist_favorite_cities"
}

class UserDefaultsManager: NSObject {
    
    static let shared = UserDefaultsManager()
    
    // MARK: Methods - Favorite Cities
    
    func getFavoriteCitiesIds() -> [String] {
        return UserDefaults.standard.stringArray(forKey: UserDefaultsKey.favoriteCities.rawValue) ?? []
    }
    
    func addFavoriteCity(id: String) {
        var favoriteIds = getFavoriteCitiesIds()
        if favoriteIds.contains(id) { return }
        favoriteIds.append(id)
        
        UserDefaults.standard.setValue(favoriteIds, forKey: UserDefaultsKey.favoriteCities.rawValue)
    }
    
    func removeFavoriteCity(id: String) {
        var favoriteIds = getFavoriteCitiesIds()
        guard let index = favoriteIds.firstIndex(of: id) else { return }
        favoriteIds.remove(at: index)
        
        UserDefaults.standard.setValue(favoriteIds, forKey: UserDefaultsKey.favoriteCities.rawValue)
    }
    
}
