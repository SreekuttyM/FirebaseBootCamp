//
//  SettingsView.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel : SettingsViewModel = SettingsViewModel()
    @Binding var isPresented : Bool
    
    var body: some View {
        Form {
            Section  {
                Button("Sign Out") {
                    try?  AuthenticationManager.shared.signOut()
                    isPresented = true
                }
            }
            if viewModel.providers.contains(.email) {
                EmailSettingsSection
            }
        }
        .onAppear {
            Task {
                try await viewModel.fetchProviders()
            }
        }
        .navigationTitle("Settings")
    }
    
    private var EmailSettingsSection : some View {
        Section("Email Settings")  {
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.changePassword()
                        isPresented = true
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        isPresented = true
                    }
                    catch {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView(isPresented: .constant(true))
}
