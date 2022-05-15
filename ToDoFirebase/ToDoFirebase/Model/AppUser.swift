//
//  AppUser.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import FirebaseFirestoreSwift


struct AppUser: Identifiable, Codable {
    
    @DocumentID var id: String?
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
}
