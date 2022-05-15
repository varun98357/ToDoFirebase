//
//  ToDoFirebaseApp.swift
//  ToDoFirebase
//
//  Created by Varun K on 12/05/22.
//

import SwiftUI
import Firebase

@main
struct ToDoFirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
