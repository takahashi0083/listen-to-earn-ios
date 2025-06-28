//
//  AppRouter.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

enum AppDestination: Hashable {
    case onboarding
    case login
    case signUp
    case main
    case settings
    case leaderboard
}

struct AppRouter: View {
    @State private var navigationPath = NavigationPath()
    @State private var isLoggedIn = false
    @State private var hasSeenOnboarding = false
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                if !hasSeenOnboarding {
                    OnboardingView()
                } else if !isLoggedIn {
                    LoginView()
                } else {
                    MainTabView()
                }
            }
            .navigationDestination(for: AppDestination.self) { destination in
                switch destination {
                case .onboarding:
                    OnboardingView()
                case .login:
                    LoginView()
                case .signUp:
                    SignUpView()
                case .main:
                    MainTabView()
                case .settings:
                    SettingsView()
                case .leaderboard:
                    LeaderboardView()
                }
            }
        }
    }
}

#Preview {
    AppRouter()
}