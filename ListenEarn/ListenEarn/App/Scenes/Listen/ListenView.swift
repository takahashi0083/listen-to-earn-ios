//
//  ListenView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct ListenView: View {
    @State private var isPlaying = false
    @State private var progress: Double = 0.3
    
    var body: some View {
        VStack(spacing: 30) {
            // Audio Cover
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 250, height: 250)
                .overlay(
                    Image(systemName: "waveform")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                )
            
            // Audio Info
            VStack(spacing: 8) {
                Text("Sample Audio Track")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Educational Content")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("Earning Rate: $0.05/min")
                    .font(.caption)
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
            }
            
            // Progress Bar
            VStack(spacing: 8) {
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
                
                HStack {
                    Text("2:30")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("8:00")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            
            // Controls
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image(systemName: "backward.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
                Button(action: { isPlaying.toggle() }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                }
                
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Listen & Earn")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListenView()
}