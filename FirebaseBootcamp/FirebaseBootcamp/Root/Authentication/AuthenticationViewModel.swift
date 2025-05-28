//
//  AuthenticationViewModel.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 28/05/2025.
//

import Foundation

@MainActor
final class AuthenticationViewModel : ObservableObject {
    
    func signIn() async throws {
        let helper = GoogleSignInHelper()
        let token = try await helper.signIn()
        try await  AuthenticationManager.shared.googleSignIn(token: token)
    }
}
