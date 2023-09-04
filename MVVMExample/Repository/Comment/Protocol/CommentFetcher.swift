//
//  CommentFetcher.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import Foundation

protocol CommentFetcher {
    var network: NetworkServiceProvider { get }
    func fetchComments() async throws -> [Comment]
}
