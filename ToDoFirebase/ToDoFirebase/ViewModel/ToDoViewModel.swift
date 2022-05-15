//
//  ToDoViewModel.swift
//  ToDoFirebase
//
//  Created by Varun K on 14/05/22.
//

import SwiftUI
import Firebase


class ToDoViewModel: ObservableObject {
    
    @Published var todos = [ToDo]()
    @Published var showCreateToDoView = false
    @Published var filterToDoSelected: SelectedButton = .all
    @Published var todosFiltered = [ToDo]()
    
    
    init() {
        loadToDos()
    }
    
    func loadToDos() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let query = COLLECTION_USERS.document(user.id ?? "").collection("to-dos").order(by: "completed", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.todos = documents.compactMap({ try? $0.data(as: ToDo.self) })
            
            for index in stride(from: 0, to: self.todos.count, by: 1) {
                self.todos[index].documentID = documents[index].documentID
            }
            self.todosFiltered = self.todos
            
            if self.filterToDoSelected != .all {
                self.todosFiltered = self.todos.filter { todo in
                    return todo.ToDoType == self.filterToDoSelected.rawValue
                }
            } else {
                self.todosFiltered = self.todos
            }
        }
    }
    
    
    func uploadToDo(todo: ToDo) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data: [String: Any] = ["title": todo.title,
                                   "description": todo.description,
                                   "ToDoType": todo.ToDoType,
                                   "completed": todo.completed,
                                   "ownerUid": user.id ?? ""
                                ]
        
        COLLECTION_USERS.document(user.id ?? "").collection("to-dos").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadToDos()
        }
    }
    
    func deleteToDo(todoID: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoID).delete() { error in
            if let error = error {
                print("Debug: \(error.localizedDescription)")
                return
            }
            self.loadToDos()
        }
    }
    
    func completeToDo(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": true]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadToDos()
        }
    }
    
    
    func unCompleteToDo(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": false]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadToDos()
        }
    }
}
