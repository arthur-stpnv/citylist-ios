//
//  citylistUITests.swift
//  citylistUITests
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import XCTest

class citylistUITests: XCTestCase {

    func testFilterButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let countriesNavigationBar = XCUIApplication().navigationBars["Countries"]
        countriesNavigationBar.buttons["Filter"].tap()
        countriesNavigationBar.buttons["Clear"].tap()
    }
}
