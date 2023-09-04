//
//  MockCommentProvider.swift
//  MVVMExampleTests
//
//  Created by Alper Ozturk on 4.09.2023.
//

import Foundation
@testable import MVVMExample

struct MockCommentProvider: CommentFetcher {
    var network: NetworkServiceProvider = MockNetworkService()
    
    func fetchComments() async throws -> [Comment] {
        return try await network.fetch(type: [Comment].self, endpoint: "")
    }
}
