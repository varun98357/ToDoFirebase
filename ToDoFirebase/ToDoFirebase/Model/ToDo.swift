//
//  ToDo.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift


struct ToDo: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    let ownerUid: String
    var title: String
    var description: String
    var ToDoType: String
    var completed: Bool
    var documentID: String? = ""
    
    
    func getType() -> SelectedButton {
        if ToDoType == "Groceries" {
            return .groceries
        } else if ToDoType == "Work" {
            return .work
        } else if ToDoType == "Home" {
            return .home
        } else if ToDoType == "School" {
            return .school
        } else if ToDoType == "Personal" {
            return .personal
        } else {
            return .extra
        }
    }
    
}
