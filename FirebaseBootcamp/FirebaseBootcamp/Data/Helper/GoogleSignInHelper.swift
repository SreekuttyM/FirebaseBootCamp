//
//  GoogleSignInHelper.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 28/05/2025.
//

import Foundation
import GoogleSignIn

struct GoogleSignInResult {
    let idToken : String
    let accessToken : String
}


class GoogleSignInHelper {
    func signIn() async throws -> GoogleSignInResult {
        guard let topVC =  await Utilities.shared.topViewController() else {
            throw URLError(.unknown)
        }
        let authResult =  try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        guard let idToken = authResult.user.idToken?.tokenString else {
            throw URLError(.unknown)
        }
        let accesstoken = authResult.user.accessToken.tokenString

        let token  = GoogleSignInResult(idToken: idToken, accessToken: accesstoken)
        return token
    }
}
