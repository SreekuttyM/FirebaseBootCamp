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

enum Providers : String {
    case google = "google.com"
    case email = "password"
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
    
}


//Google Sign In
extension AuthenticationManager {
    @discardableResult
    func googleSignIn(token : GoogleSignInResult) async throws -> AuthResult {
        let credential = GoogleAuthProvider.credential(withIDToken: token.idToken, accessToken: token.accessToken)
        let authResult =  try await Auth.auth().signIn(with: credential)
        return AuthResult(user: authResult.user)
    }
    
    
    func getProviders() throws -> [Providers] {
        guard  let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badURL)
        }
        var providers : [Providers] = []
        for provider in providerData {
            if let option = Providers(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
        print(providers)
        return providers
    }
}

//Email Sign In
extension AuthenticationManager {
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
    
    func resetPassword(email: String)  async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password:String)  async throws {
        guard  let authResult = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        try await authResult.updatePassword(to: password)
    }
    
  
    func signOut()  throws {
        try  Auth.auth().signOut()
    }
    
}
