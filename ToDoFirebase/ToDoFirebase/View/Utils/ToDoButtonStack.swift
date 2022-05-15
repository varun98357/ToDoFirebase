//
//  ToDoButtonStack.swift
//  ToDoFirebase
//
//  Created by Varun K on 14/05/22.
//

import SwiftUI

struct ToDoButtonStack: View {
    
    @ObservedObject var viewModel: ToDoViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ToDoButton(buttonType: .all, viewModel: viewModel)
                ToDoButton(buttonType: .groceries, viewModel: viewModel)
                ToDoButton(buttonType: .work, viewModel: viewModel)
                ToDoButton(buttonType: .school, viewModel: viewModel)
                ToDoButton(buttonType: .home, viewModel: viewModel)
                ToDoButton(buttonType: .personal, viewModel: viewModel)
                ToDoButton(buttonType: .extra, viewModel: viewModel)
            }
        }
    }
}

struct ToDoButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        ToDoButtonStack(viewModel: ToDoViewModel())
    }
}

struct ToDoButton: View {
    
    let buttonType: SelectedButton
    @ObservedObject var viewModel: ToDoViewModel
    
    var body: some View {
        Button {
            viewModel.filterToDoSelected = buttonType
            
            if viewModel.filterToDoSelected != .all {
                viewModel.todosFiltered = viewModel.todos.filter({ todo in
                    return todo.ToDoType == viewModel.filterToDoSelected.rawValue
                })
            } else {
                viewModel.todosFiltered = viewModel.todos
            }
            
        } label: {
            Text("\(buttonType.getValue())")
                .foregroundColor(viewModel.filterToDoSelected == buttonType ? .white : Color(.systemGray))
                .frame(width: 100, height: 40)
                .background(buttonType == viewModel.filterToDoSelected ? Color("lightBlue") : Color(.systemGray6))
                .cornerRadius(20)
        }
    }
    
}
