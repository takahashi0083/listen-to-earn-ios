//
//  EarningsView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct EarningsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Total Earnings Card
                VStack(spacing: 12) {
                    Text("Total Earnings")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("$247.50")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    
                    Text("This Month")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(16)
                
                // Quick Stats
                HStack(spacing: 16) {
                    EarningStatCard(title: "Today", amount: "$12.50", icon: "calendar")
                    EarningStatCard(title: "This Week", amount: "$85.00", icon: "calendar.badge.plus")
                }
                
                // Withdrawal Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Withdrawal")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Button("Withdraw Earnings") {
                        // Withdrawal action
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
                    
                    Text("Minimum withdrawal: $25.00")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(12)
                
                // Recent Earnings
                VStack(alignment: .leading, spacing: 12) {
                    Text("Recent Earnings")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ForEach(0..<5) { index in
                        EarningRow(
                            title: "Audio Session \(index + 1)",
                            amount: "$\(String(format: "%.2f", Double.random(in: 1...5)))",
                            date: "Today"
                        )
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Earnings")
    }
}

struct EarningStatCard: View {
    let title: String
    let amount: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            
            Text(amount)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

struct EarningRow: View {
    let title: String
    let amount: String
    let date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                
                Text(date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(amount)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    EarningsView()
}