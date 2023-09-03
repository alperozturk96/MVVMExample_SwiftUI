//
//  CommentRepository.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import Foundation

struct CommentRepository: CommentFetcher {
    var network: NetworkService { NetworkService() }
    
    func fetchComments() async throws -> [Comment] {
        return try await network.fetch(type: [Comment].self, endpoint: "comments")
    }
}
