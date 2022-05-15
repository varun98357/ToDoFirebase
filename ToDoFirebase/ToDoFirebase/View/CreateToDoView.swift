//
//  CreateToDoView.swift
//  ToDoFirebase
//
//  Created by Varun K on 15/05/22.
//

import SwiftUI

struct CreateToDoView: View {
    
    let user: AppUser
    
    
    @State private var title = ""
    @State private var todoDescription = ""
    @State private var todoType = ""
    @State private var completed = false
    
    @ObservedObject var viewModel: ToDoViewModel
    
    var body: some View {
        VStack {
            ToDoButtonStack(viewModel: viewModel)
                .padding()
                .padding(.top)
            
            ToDoTextField(text: $title, placeholder: "ToDo...")
                .padding([.horizontal, .bottom])
            
            CustomTextEditor(text: $todoDescription, placeholder: Text("Description"), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal, .bottom])
            
            HStack {
                Button {
                    viewModel.uploadToDo(todo: ToDo(ownerUid: user.id ?? "", title: title, description: todoDescription, ToDoType: viewModel.filterToDoSelected == .all
                                                    ? "Extra" : viewModel.filterToDoSelected.rawValue, completed: false))
                    
                    viewModel.showCreateToDoView = false
                } label: {
                    CreateToDoButton()
                }
                
                Button {
                    viewModel.showCreateToDoView = false
                } label: {
                    CancelToDoButton()
                }
            }
            .padding(.bottom, 10)
            
            Spacer()
            
            
        } // end of VStack
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 360)
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

struct CreateToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoView(user: AppUser(uid: "", firstName: "", lastName: "", email: ""), viewModel: ToDoViewModel())
    }
}


struct CreateToDoButton: View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(Color.blue.opacity(0.6))
            .clipShape(Capsule())
    }
}

struct CancelToDoButton: View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 100, height: 40)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
    }
}
