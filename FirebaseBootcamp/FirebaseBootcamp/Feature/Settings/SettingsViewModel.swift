//
//  SettingsViewModel.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 28/05/2025.
//

import Foundation

@MainActor
class SettingsViewModel : ObservableObject {
    @Published var providers : [Providers] = []
    
    func signOut() {
       try? AuthenticationManager.shared.signOut()
    }
    
    func fetchProviders() async throws {
        providers = try  AuthenticationManager.shared.getProviders()
    }
    
    func changePassword() async throws {
        try await AuthenticationManager.shared.updatePassword(password: "123123123")
    }
    
    func resetPassword() async throws {
        try await AuthenticationManager.shared.resetPassword(email: "test56@yopmail.com")
    }
}
