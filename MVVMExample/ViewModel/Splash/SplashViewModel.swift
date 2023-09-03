//
//  SplashViewModel.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import Foundation

final class SplashViewModel: ObservableObject {
    
    // MARK: - Published Variables
    @Published var navigateToHome = false
    
    func completeSplashAnimation() async {
        try? await Task.sleep(until: .now + .seconds(1), clock: .continuous)
        await MainActor.run {
            navigateToHome = true
        }
    }
}
