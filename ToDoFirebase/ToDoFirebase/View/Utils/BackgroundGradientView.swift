//
//  BackgroundGradientView.swift
//  ToDoFirebase
//
//  Created by Varun K on 13/05/22.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(colors: [Color.blue, Color.blue.opacity(0.5)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
