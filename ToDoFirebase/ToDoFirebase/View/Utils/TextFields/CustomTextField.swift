//
//  CustomTextField.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var foregroundColor: Color?
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(foregroundColor ?? Color(white: 1, opacity: 0.8))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor ?? .white)
                
                TextField("", text: $text)
                    .textInputAutocapitalization(.none)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("test"), placeholder: Text("HI"), imageName: "hi")
    }
}
