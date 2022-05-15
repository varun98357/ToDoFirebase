//
//  MockData.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import Foundation


let appUser01 = AppUser(id: "1", uid: "1", firstName: "Varun", lastName: "Kumar", email: "varun.kumar@gmail.com")

let todo01 = ToDo(id: "1", ownerUid: "1", title: "Tomatoes", description: "Must be from publix", ToDoType: "Groceries", completed: false)
let todo02 = ToDo(id: "2", ownerUid: "2", title: "Juice", description: "Fresh Juice", ToDoType: "Groceries", completed: true)
let todo03 = ToDo(id: "3", ownerUid: "3", title: "Do Homework", description: "", ToDoType: "School", completed: false)
