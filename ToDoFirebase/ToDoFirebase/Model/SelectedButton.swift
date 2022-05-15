//
//  SelectedButton.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import Foundation


enum SelectedButton: String {
    case all = "All"
    case groceries = "Groceries"
    case work = "Work"
    case school = "School"
    case home = "Home"
    case personal = "Personal"
    case extra = "Extra"
    
    func getValue() -> String {
        return self.rawValue
    }
}
