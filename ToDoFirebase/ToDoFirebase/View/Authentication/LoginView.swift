//
//  LoginView.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            VStack {
                LogoView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
