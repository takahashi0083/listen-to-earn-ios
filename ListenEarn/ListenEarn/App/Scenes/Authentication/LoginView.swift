//
//  LoginView.swift
//  ListenEarn
//
//  Created by Claude on 2025/06/28.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            
            Button("Sign In") {
                // Login action
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
            
            Button("Create Account") {
                // Navigate to sign up
            }
            .foregroundColor(.blue)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LoginView()
}