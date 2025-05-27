//
//  SettingsView.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented : Bool
    var body: some View {
        Form {
            Button {
                try?  AuthenticationManager.shared.signOut()
                isPresented = true
            } label: {
                Text("LogOut")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            
            Button {
                Task {
                    do {
                        try await AuthenticationManager.shared.updatePassword()
                        isPresented = true
                    }
                    catch {
                        print(error)
                    }
                }
            } label: {
                Text("Update Password")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            
            Button {
                Task {
                    do {
                        try await AuthenticationManager.shared.resetPassword()
                        isPresented = true
                    }
                    catch {
                        print(error)
                    }
                }
            } label: {
                Text("Reset Password")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(isPresented: .constant(true))
}
