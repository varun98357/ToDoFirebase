//
//  DashboardView.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State private var searchText = ""
    
    @ObservedObject var viewModel = ToDoViewModel()
        
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("- AllDone -")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signout()
                        } label: {
                            Text("Logout")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }
                } // end of HStack Overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                
                ToDoButtonStack(viewModel: viewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.todosFiltered.isEmpty {
                    AddToDoLogo()
                        .padding(.top)
                }
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.todosFiltered, id: \.id) { todo in
                            if searchText == "" {
                                ToDoView(todo: ToDo(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, ToDoType: todo.ToDoType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                            } else {
                                if todo.title.lowercased().contains(searchText.lowercased()) ||
                                    todo.description.lowercased().contains(searchText.lowercased()) {
                                    ToDoView(todo: ToDo(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, ToDoType: todo.ToDoType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                                }
                            }
                        } // end of foreach
                    } // end of VStack
                } // end of ScrollView
                 
            } // end of VStack
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            viewModel.showCreateToDoView = true
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(Color("lightBlue"))
                                .cornerRadius(30)
                        }
                        .padding(20)
                    }
                }
            
            )
            
            if viewModel.showCreateToDoView {
                BlankView()
                CreateToDoView(user: user, viewModel: viewModel)
            }
            
        } // end of ZStack
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
