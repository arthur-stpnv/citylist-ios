//
//  citylistTests.swift
//  citylistTests
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import XCTest
@testable import citylist

class citylistTests: XCTestCase {
    
    func testConstraints() throws {
        let view = UIView()
        view.width(equalToConstant: 50)
        view.height(equalToConstant: 50)
        
        XCTAssertEqual(view.constraints.count, 2)
    }
    
    func testFavoriteCity() throws {
        let testCity = City(testId: "test_id")
        
        UserDefaultsManager.shared.removeFavoriteCity(id: testCity.id)
        UserDefaultsManager.shared.addFavoriteCity(id: testCity.id)
        
        let favoriteCities = UserDefaultsManager.shared.getFavoriteCitiesIds()
        let city = favoriteCities.first(where: { $0 == testCity.id })
        
        XCTAssertNotNil(city)
        
        UserDefaultsManager.shared.removeFavoriteCity(id: testCity.id)
    }

}
