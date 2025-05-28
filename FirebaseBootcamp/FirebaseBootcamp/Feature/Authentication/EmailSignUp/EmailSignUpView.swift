//
//  EmailSignUpView.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import SwiftUI

struct EmailSignUpView: View {
    @StateObject var viewModel : EmailSignUpViewModel = EmailSignUpViewModel()
    @Binding var isPresented : Bool

    var body: some View {
        VStack{
            TextField("Email", text: $viewModel.email)
                .padding()
                .frame(height :50)
                .background(.gray.opacity(0.3))
                .cornerRadius(12)
            TextField("Email", text: $viewModel.password)
                .padding()
                .frame(height :50)
                .background(.gray.opacity(0.3))
                .cornerRadius(12)
            
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        isPresented = false
                    }
                    catch {
                        print(error)
                    }
                }
                Task {
                    do {
                        try await viewModel.signIn()
                        isPresented = false
                    }
                    catch {
                        print(error)
                    }
                }
                    
            } label: {
                Text("Sign Up")
                    .frame(maxWidth:.infinity)
                    .frame(height:55)
                    .bold()
                    .background(.accent)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Email SignUp")
    }
}

#Preview {
    EmailSignUpView(isPresented: .constant(true))
}
