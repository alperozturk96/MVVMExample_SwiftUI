//
//  MVVMExampleApp.swift
//  MVVMExample
//
//  Created by Alper Ozturk on 3.09.2023.
//

import SwiftUI

@main
struct MVVMExampleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashView()
            }
            .preferredColorScheme(.dark)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}
