//
//  CommentDetailView.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import SwiftUI

struct CommentDetailView: View {
    
    // MARK: - Dependencies
    private let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                Text(comment.email)
                    .font(.title)
                
                Text(comment.body)
                    .font(.body)
            }
            .padding(.all, 20)
            .frame(width: geo.size.width)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(16)
        }
        .navigationTitle("comment_detail_view_nav_bar_title".localized)
    }
}

struct CommentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CommentDetailView(comment: .init(postID: 1, id: 1, name: "Alper", email: "test@gmail.com", body: "This is a test message for SwiftUI Preview"))
    }
}
