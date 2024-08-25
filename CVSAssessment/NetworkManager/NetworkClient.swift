//
//  NetworkClient.swift
//  CVSAssessment
//
//  Created by Isha Patel on 8/24/24.
//

import Foundation
protocol NetworkClient {
    
    // MARK: - Method Requirements
    func fetchData<T: Decodable>(for: T.Type, url: String) async throws -> T?
}
