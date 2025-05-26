//
//  FirebaseBootcampApp.swift
//  FirebaseBootcamp
//
//  Created by Sreekutty Maya on 26/05/2025.
//

import SwiftUI
import FirebaseCore

@main
struct FirebaseBootcampApp: App {
    init() {
        FirebaseApp.configure()
        print("Configured Firebase")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
