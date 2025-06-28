//
//  ProfileView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            // Profile Header
            Section {
                HStack(spacing: 16) {
                    Circle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("John Doe")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("john.doe@example.com")
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        Text("Member since Jan 2025")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
            
            // Account Section
            Section("Account") {
                ProfileRow(title: "Edit Profile", icon: "person.circle", action: {})
                ProfileRow(title: "Payment Methods", icon: "creditcard", action: {})
                ProfileRow(title: "Notification Settings", icon: "bell", action: {})
            }
            
            // Statistics Section
            Section("Statistics") {
                ProfileRow(title: "Listening History", icon: "clock.arrow.circlepath", action: {})
                ProfileRow(title: "Achievements", icon: "trophy", action: {})
                ProfileRow(title: "Leaderboard", icon: "chart.bar", action: {})
            }
            
            // Support Section
            Section("Support") {
                ProfileRow(title: "Help Center", icon: "questionmark.circle", action: {})
                ProfileRow(title: "Contact Support", icon: "envelope", action: {})
                ProfileRow(title: "Terms of Service", icon: "doc.text", action: {})
                ProfileRow(title: "Privacy Policy", icon: "lock.shield", action: {})
            }
            
            // Sign Out
            Section {
                Button("Sign Out") {
                    // Sign out action
                }
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileRow: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 20, alignment: .leading)
                    .foregroundColor(.blue)
                
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    ProfileView()
}