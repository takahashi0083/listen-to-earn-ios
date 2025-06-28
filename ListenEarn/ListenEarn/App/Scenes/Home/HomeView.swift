//
//  HomeView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Welcome Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Welcome Back!")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Ready to earn some rewards?")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    // Quick Stats
                    HStack(spacing: 16) {
                        StatCard(title: "Today's Earnings", value: "$12.50", icon: "dollarsign.circle")
                        StatCard(title: "Listening Time", value: "2h 30m", icon: "clock")
                    }
                    
                    // Featured Content
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Featured Content")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(0..<5) { _ in
                                    ContentCard()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

struct ContentCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .fill(Color.blue.opacity(0.3))
                .frame(width: 120, height: 80)
                .cornerRadius(8)
            
            Text("Audio Title")
                .font(.caption)
                .fontWeight(.medium)
                .lineLimit(2)
            
            Text("$2.50")
                .font(.caption2)
                .foregroundColor(.green)
                .fontWeight(.semibold)
        }
        .frame(width: 120)
    }
}

#Preview {
    HomeView()
}