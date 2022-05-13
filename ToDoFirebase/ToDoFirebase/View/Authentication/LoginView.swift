//
//  LoginView.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                
                VStack {
                    LogoView()
                        .padding(.bottom, 25)
                    
                    VStack(spacing: 20) {
                        EmailTextField(text: $email)
                        
                        PasswordSecureField(text: $password, placeholder: "Password")
                    }
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Forgot Password")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        AuthenticateButtonView(text: "Sign In")
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: SignupView()
                                                    .navigationBarHidden(true)
                    ) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                    }
                    .padding(.bottom, 16)
                    
                }
                .padding(.top, -44)
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
