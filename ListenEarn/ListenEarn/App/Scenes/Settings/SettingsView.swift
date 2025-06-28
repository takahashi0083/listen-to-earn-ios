//
//  SettingsView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var autoPlayEnabled = false
    @State private var darkModeEnabled = false
    @State private var downloadQuality = "High"
    
    let qualityOptions = ["Low", "Medium", "High"]
    
    var body: some View {
        List {
            // General Settings
            Section("General") {
                HStack {
                    Image(systemName: "bell")
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    Text("Push Notifications")
                    
                    Spacer()
                    
                    Toggle("", isOn: $notificationsEnabled)
                }
                
                HStack {
                    Image(systemName: "moon")
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    Text("Dark Mode")
                    
                    Spacer()
                    
                    Toggle("", isOn: $darkModeEnabled)
                }
            }
            
            // Audio Settings
            Section("Audio") {
                HStack {
                    Image(systemName: "play.circle")
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    Text("Auto Play Next")
                    
                    Spacer()
                    
                    Toggle("", isOn: $autoPlayEnabled)
                }
                
                HStack {
                    Image(systemName: "arrow.down.circle")
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    Text("Download Quality")
                    
                    Spacer()
                    
                    Picker("Quality", selection: $downloadQuality) {
                        ForEach(qualityOptions, id: \.self) { quality in
                            Text(quality).tag(quality)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            
            // Account Settings
            Section("Account") {
                SettingsRow(title: "Change Password", icon: "key", action: {})
                SettingsRow(title: "Delete Account", icon: "trash", action: {})
                    .foregroundColor(.red)
            }
            
            // Data & Storage
            Section("Data & Storage") {
                SettingsRow(title: "Clear Cache", icon: "trash.circle", action: {})
                SettingsRow(title: "Download Management", icon: "icloud.and.arrow.down", action: {})
            }
            
            // About
            Section("About") {
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    Text("Version")
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .foregroundColor(.secondary)
                }
                
                SettingsRow(title: "Rate App", icon: "star", action: {})
                SettingsRow(title: "Share App", icon: "square.and.arrow.up", action: {})
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsRow: View {
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
    SettingsView()
}