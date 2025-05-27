//
//  EmailSignUpViewModel.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import Foundation


class EmailSignUpViewModel : ObservableObject {
    @Published var password : String = ""
    @Published var email : String = ""
    
    func signUp() async throws {
        guard !email.isEmpty && !password.isEmpty else {
            print("Email or password is invalid")
            return
        }
        try await AuthenticationManager.shared.createUserWith(email: email, password: password)
    }

    func signIn() async throws {
        guard !email.isEmpty && !password.isEmpty else {
            print("Email or password is invalid")
            return
        }
        try await AuthenticationManager.shared.signIn(email: email, password: password)
    }
}
