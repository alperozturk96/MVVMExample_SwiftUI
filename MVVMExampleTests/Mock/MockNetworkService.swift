//
//  MockNetworkService.swift
//  MVVMExampleTests
//
//  Created by Alper Ozturk on 4.09.2023.
//

import Foundation
@testable import MVVMExample

final class MockNetworkService: NetworkServiceProvider {
    var baseUrl: String = "https://example.com/"
    
    var urlSession: URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: config)
    }
    
    func fetch<T>(type: T.Type, endpoint: String) async throws -> T where T : Decodable {
        guard let url = URL(string: baseUrl + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        print("MockService fetch called")
        let request = URLRequest(url: url)
        
        let (data, response) = try await urlSession.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
