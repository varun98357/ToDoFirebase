//
//  SignupView.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import SwiftUI

struct SignupView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            
            VStack {
                LogoView()
                    .padding(.bottom, 25)
            
                VStack(spacing: 20) {
                    UserTextField(text: $firstName, placeholder: "First Name")
                    UserTextField(text: $lastName, placeholder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password")
                    PasswordSecureField(text: $confirmPassword, placeholder: "Confirm Password")
                }
                .padding(.horizontal, 32)
                
                Button {
                    
                } label: {
                    AuthenticateButtonView(text: "Sign Up")
                        .padding()
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom, 16)
            }
            .padding(.top, 20)
            
        } // end of ZStack
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
