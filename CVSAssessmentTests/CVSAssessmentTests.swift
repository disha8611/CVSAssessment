//
//  CVSAssessmentTests.swift
//  CVSAssessmentTests
//
//  Created by Isha Patel on 8/24/24.
//

import XCTest
@testable import CVSAssessment

final class CVSAssessmentTests: XCTestCase {
    private var viewModel: ImageViewModel?
    
    override func setUpWithError() throws {
        viewModel = ImageViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testLoadingStateBeforeFetch() async throws {
        
        XCTAssertFalse(viewModel?.loading ?? true, "Loading should be false before data fetching starts.")
        try await viewModel?.mockLoadData(url: "")
    
    }
    
    func testImageDataCount() async throws {
        
        try await viewModel?.mockLoadData(url: "")
        XCTAssertEqual(viewModel?.imageData.count, 3, "There should be 3 items in imageData.")
        
    }
    
    func testFirstItemTitle() async throws {
        
        try await viewModel?.mockLoadData(url: "")
        XCTAssertEqual(viewModel?.imageData.first?.title, "Item 1", "The title of the first item should be 'Item 1'.")
        
    }
    
    func testLoadingStateAfterFailure() async throws {
        
        try await viewModel?.mockLoadData(url: "")
        XCTAssertTrue(viewModel?.loading ?? false, "Loading should be true after fetch failure.")
        
    }
    
    func testDataPresenceAfterFetch() async throws {
        
        try await viewModel?.mockLoadData(url: "")
        XCTAssertNotNil(viewModel?.imageData, "Image data should not be nil after successful fetch.")
        
    }
    
    func testDataContainsSpecificItem() async throws {
        
        try await viewModel?.mockLoadData(url: "")
        let titles = viewModel?.imageData.map { $0.title }
        XCTAssertTrue(titles?.contains("Item 2") ?? false, "Image data should contain an item with title 'Item 2'.")
        
    }
}
