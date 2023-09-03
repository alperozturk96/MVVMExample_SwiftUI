//
//  CommentViewModel.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import Foundation

final class CommentViewModel: ObservableObject {

    // MARK: - Dependencies
    private let repository: CommentFetcher
    
    init(repository: CommentFetcher = CommentRepository()) {
        self.repository = repository
    }
    
    // MARK: - Published Variables
    @Published var comments = [Comment]()
    
    func fetchComments() {
        Task {
            do {
                let result = try await repository.fetchComments()
                await MainActor.run {
                    comments = result
                }
            } catch {
                print("Error caught at fetchComments: \(error.localizedDescription)")
            }
        }
    }
}
