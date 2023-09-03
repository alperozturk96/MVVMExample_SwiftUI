//
//  NetworkService.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 14.8.23..
//

import Foundation

final class NetworkService {
    
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    /// Initialize for JsonPlaceholder API
    convenience init() {
        self.init(baseUrl: AppEnvironment.baseUrl)
    }
    
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache.shared
        config.timeoutIntervalForRequest = 30
        return URLSession(configuration: config)
    }()
    
    func fetch<T: Decodable>(type: T.Type, endpoint: String) async throws -> T {
        guard let url = URL(string: baseUrl + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        
        print("Fetching response")
        let (data, response) = try await urlSession.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
