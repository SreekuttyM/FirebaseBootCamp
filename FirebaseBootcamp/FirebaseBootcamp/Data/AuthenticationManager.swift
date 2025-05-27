//
//  AuthenticationManager.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import FirebaseAuth

struct AuthResult {
    let userId : String
    let email : String?
    let photoURL : String?
   
    init(user : User) {
        self.userId = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

class AuthenticationManager : ObservableObject {
    static let shared  = AuthenticationManager()
    private init(){}
    
    func getAuthenticatedUser() throws -> AuthResult {
        guard  let authResult = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        return AuthResult(user: authResult)
    }
    @discardableResult
    func createUserWith(email: String, password: String) async throws ->  AuthResult {
        let authResult =  try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthResult(user: authResult.user)
    }
    
    @discardableResult
    func signIn(email: String, password: String) async throws ->  AuthResult {
        let authResult =  try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthResult(user: authResult.user)
    }
    
    func resetPassword()  async throws {
        try await Auth.auth().sendPasswordReset(withEmail: "test1@gmail.com")
    }
    
    func updatePassword()  async throws {
        guard  let authResult = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        try await authResult.updatePassword(to: "123123123")
    }
    
  
    func signOut()  throws {
        try  Auth.auth().signOut()
    }
}
