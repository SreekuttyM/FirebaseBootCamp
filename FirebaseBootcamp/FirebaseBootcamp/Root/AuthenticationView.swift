//
//  AuthenticationView.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var isPresented : Bool 
    var body: some View {
        VStack {
            NavigationLink {
                EmailSignUpView( isPresented: $isPresented)
            } label: {
                Text("Sign In With Email")
                    .frame(maxWidth:.infinity)
                    .frame(height:55)
                    .bold()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .padding()
            }
            Spacer()
        }
        .navigationTitle("Email SignIn")
    }
}

#Preview {
    AuthenticationView(isPresented: .constant(true))
}
