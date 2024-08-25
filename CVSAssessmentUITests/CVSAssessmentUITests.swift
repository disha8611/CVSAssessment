//
//  CVSAssessmentUITests.swift
//  CVSAssessmentUITests
//
//  Created by Isha Patel on 8/24/24.
//

import XCTest

final class CVSAssessmentUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    
    }
    
    func testContentViewLoads() throws {
        let app = XCUIApplication()
        app.launch()
        
        let navigationTitle = app.navigationBars["Image Search"]
        XCTAssertTrue(navigationTitle.exists, "Navigation bar with title 'Image Search' should exist.")
    }
    
    func testImageGridLoads() throws {
        let app = XCUIApplication()
        app.launch()
        
        let imageGrid = app.scrollViews.otherElements["ImageGridView"]
        XCTAssertTrue(imageGrid.waitForExistence(timeout: 5), "Image grid should be visible.")
    }
    
    func testSearchBarTextUpdates() throws {
        let app = XCUIApplication()
        app.launch()
        
        let searchBar = app.textFields["searchBar"]
        XCTAssertTrue(searchBar.waitForExistence(timeout: 5), "Search bar should be present.")
        searchBar.tap()
        searchBar.typeText("Test")
        
        XCTAssertEqual(searchBar.value as? String, "Test", "Search bar text should be updated.")
    }
}
