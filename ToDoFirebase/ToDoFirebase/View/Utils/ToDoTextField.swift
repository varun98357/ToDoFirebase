//
//  ToDoTextField.swift
//  ToDoFirebase
//
//  Created by Varun K on 15/05/22.
//

import SwiftUI

struct ToDoTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "checkmark.square", foregroundColor: .gray)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

struct ToDoTextField_Previews: PreviewProvider {
    static var previews: some View {
        ToDoTextField(text: .constant(""), placeholder: "Title")
    }
}
