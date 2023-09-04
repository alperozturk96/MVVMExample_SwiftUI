//
//  SplashView.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - State Object
    @StateObject private var viewModel = SplashViewModel()
    
    init(viewModel: SplashViewModel = SplashViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                
                Text("I ❤️ SwiftUI")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .task {
            await viewModel.completeSplashAnimation()
        }
        .navigationDestination(isPresented: $viewModel.navigateToHome) {
            CommentView()
        }
    }
}

// MARK: - Preview
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .preferredColorScheme(.dark)
    }
}
