//
//  AuthenticationView.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationView: View {
    @StateObject private var viewModel : AuthenticationViewModel = AuthenticationViewModel()
    @Binding var isPresented : Bool
    var body: some View {
        VStack(spacing:20) {
            EmailSignUpButton
            GoogleSignInButton
            Spacer()
        }
        .padding()
        .navigationTitle("Authentication")
    }
    
    private var EmailSignUpButton : some View {
        NavigationLink {
            EmailSignUpView( isPresented: $isPresented)
        } label: {
            Text("Sign In With Email")
                .frame(maxWidth:.infinity)
                .frame(height:55)
                .bold()
                .background(.accent)
                .foregroundStyle(.white)
                .cornerRadius(12)
        }
    }
    
    private var GoogleSignInButton : some View {
        GoogleSignInSwift.GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light,style: .wide, state: .normal)) {
            Task {
                do {
                    try await viewModel.signIn()
                    isPresented = false
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    AuthenticationView(isPresented: .constant(true))
}
