//
//  CommentView.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import SwiftUI

struct CommentView: View {
    
    // MARK: - State Object
    @StateObject private var viewModel = CommentViewModel()
    
    init(viewModel: CommentViewModel = CommentViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { geo in
            List {
                ForEach(viewModel.comments) { comment in
                    NavigationLink(destination: CommentDetailView(comment: comment)) {
                        CommentItem(comment)
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .navigationTitle("comment_view_nav_bar_title".localized)
            .navigationBarBackButtonHidden()
            .task {
                viewModel.fetchComments()
            }
        }
    }
}

// MARK: - ChildViews
extension CommentView {
    private func CommentItem(_ item: Comment) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("comment_view_name_prefix".localized + item.name)
                .font(.title)
            
            Text("comment_view_email_prefix".localized + item.email)
                .font(.title2)
            
            Text(item.body)
                .font(.body)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
