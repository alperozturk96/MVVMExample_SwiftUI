//
//  CommentFetcher.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import Foundation

protocol CommentFetcher {
    var network: NetworkService { get }    
    func fetchComments() async throws -> [Comment]
}
