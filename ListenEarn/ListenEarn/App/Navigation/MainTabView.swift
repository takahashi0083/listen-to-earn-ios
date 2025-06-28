//
//  MainTabView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationStack {
                ListenView()
            }
            .tabItem {
                Image(systemName: "headphones")
                Text("Listen")
            }
            
            NavigationStack {
                EarningsView()
            }
            .tabItem {
                Image(systemName: "dollarsign.circle")
                Text("Earnings")
            }
            
            NavigationStack {
                HistoryView()
            }
            .tabItem {
                Image(systemName: "clock.arrow.circlepath")
                Text("History")
            }
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

#Preview {
    MainTabView()
}