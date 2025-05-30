//
//  RootView.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 27/05/2025.
//

import SwiftUI

struct RootView: View {
    @State var isPresented : Bool = false
    var body: some View {
        ZStack {
            if(!isPresented) {
                SettingsView(isPresented:$isPresented)
            }
        }
        .tint(.accent)
        .onAppear {
            let user = try? AuthenticationManager.shared.getAuthenticatedUser()
            isPresented = user == nil
            
        }
        .fullScreenCover(isPresented: $isPresented) {
            NavigationStack {
                AuthenticationView(isPresented: $isPresented)
            }
        }
    }
}

#Preview {
    RootView()
}
