//
//  OnboardingView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "headphones")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            Text("Welcome to ListenEarn")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Earn rewards by listening to audio content")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button("Get Started") {
                // Navigation action
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .navigationTitle("Onboarding")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    OnboardingView()
}