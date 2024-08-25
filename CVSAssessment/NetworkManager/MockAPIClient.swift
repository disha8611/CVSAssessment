//
//  MockAPIClient.swift
//  CVSAssessment
//
//  Created by Isha Patel on 8/24/24.
//
//

import Foundation

class MockAPIManager: NetworkClient {
    static let mockSharedInstance = MockAPIManager()
    private init() {}
    
    // MARK: - Public Method
       /// Fetches mock data for the given type and URL.

    func fetchData<T>(for: T.Type, url: String) async throws -> T? where T: Decodable {
        
        let items = [
            Item(title: "Item 1", link: "Link 1", media: Media(m: "https://picsum.photos/200/300"), description: "Description 1", published: "2024-01-01", author: "Author 1"),
            Item(title: "Item 2", link: "Link 2", media: Media(m: "https://picsum.photos/200/300"), description: "Description 2", published: "2024-01-02", author: "Author 2"),
            Item(title: "Item 3", link: "Link 3", media: Media(m: "https://picsum.photos/200/300"), description: "Description 3", published: "2024-01-03", author: "Author 3")
        ]
        
        if T.self == [Item].self {
            return items as? T
        }
        return nil
    }
}

