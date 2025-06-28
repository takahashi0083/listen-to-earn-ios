//
//  HistoryView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct HistoryView: View {
    @State private var selectedFilter = "All"
    let filterOptions = ["All", "Today", "This Week", "This Month"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Filter Picker
            Picker("Filter", selection: $selectedFilter) {
                ForEach(filterOptions, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            // History List
            List {
                ForEach(0..<10) { index in
                    HistoryRow(
                        title: "Audio Session \(index + 1)",
                        duration: "\(Int.random(in: 5...45)) minutes",
                        earned: "$\(String(format: "%.2f", Double.random(in: 1...8)))",
                        date: dateString(for: index)
                    )
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("History")
    }
    
    private func dateString(for index: Int) -> String {
        let calendar = Calendar.current
        let today = Date()
        let date = calendar.date(byAdding: .day, value: -index, to: today) ?? today
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter.string(from: date)
    }
}

struct HistoryRow: View {
    let title: String
    let duration: String
    let earned: String
    let date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.medium)
                    
                    Text(duration)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(earned)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    Text("Completed")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
            
            Text(date)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Divider()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    HistoryView()
}