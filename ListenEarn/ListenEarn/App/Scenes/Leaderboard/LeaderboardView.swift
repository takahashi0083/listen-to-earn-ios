//
//  LeaderboardView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct LeaderboardView: View {
    @State private var selectedPeriod = "This Week"
    let periods = ["Today", "This Week", "This Month", "All Time"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Period Picker
            Picker("Period", selection: $selectedPeriod) {
                ForEach(periods, id: \.self) { period in
                    Text(period).tag(period)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            // Top 3 Section
            VStack(spacing: 16) {
                Text("Top Earners")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                HStack(alignment: .bottom, spacing: 20) {
                    // 2nd Place
                    VStack(spacing: 8) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Text("2")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                            )
                        
                        Text("Alex")
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Text("$89.50")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                    .frame(height: 100)
                    
                    // 1st Place
                    VStack(spacing: 8) {
                        Circle()
                            .fill(Color.yellow.opacity(0.8))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "crown.fill")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                            )
                        
                        Text("Sarah")
                            .font(.body)
                            .fontWeight(.bold)
                        
                        Text("$125.75")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    .frame(height: 120)
                    
                    // 3rd Place
                    VStack(spacing: 8) {
                        Circle()
                            .fill(Color.brown.opacity(0.3))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Text("3")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.brown)
                            )
                        
                        Text("Mike")
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Text("$76.25")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                    .frame(height: 100)
                }
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(16)
            }
            .padding()
            
            // Full Leaderboard
            List {
                ForEach(4..<21) { position in
                    LeaderboardRow(
                        position: position,
                        name: "User \(position)",
                        earnings: "$\(String(format: "%.2f", Double.random(in: 10...75)))",
                        isCurrentUser: position == 12
                    )
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Leaderboard")
    }
}

struct LeaderboardRow: View {
    let position: Int
    let name: String
    let earnings: String
    let isCurrentUser: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            // Position
            Text("\(position)")
                .font(.body)
                .fontWeight(.semibold)
                .frame(width: 30, alignment: .leading)
                .foregroundColor(isCurrentUser ? .blue : .primary)
            
            // Avatar
            Circle()
                .fill(isCurrentUser ? Color.blue.opacity(0.3) : Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.body)
                        .foregroundColor(isCurrentUser ? .blue : .gray)
                )
            
            // Name
            Text(isCurrentUser ? "You" : name)
                .font(.body)
                .fontWeight(isCurrentUser ? .semibold : .regular)
                .foregroundColor(isCurrentUser ? .blue : .primary)
            
            Spacer()
            
            // Earnings
            Text(earnings)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
        .background(isCurrentUser ? Color.blue.opacity(0.1) : Color.clear)
        .cornerRadius(8)
    }
}

#Preview {
    LeaderboardView()
}