//
//  SearchBarView.swift
//  ToDoFirebase
//
//  Created by Varun K on 14/05/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @State var isSearching = false
    
    
    var body: some View {
        HStack {
            TextField("Search ToDo", text: $searchText)
                .searchTextFieldStyle()
                .onTapGesture {
                    isSearching = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("lightBlue"))
                        
                        Spacer()
                        
                        if isSearching {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                            }
                        }
                        
                    }
                        .padding(.horizontal, 8)
                        .foregroundColor(.gray)
                )
                .transition(.move(edge: .trailing))
            
            
            if isSearching {
                Button {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color("lightBlue"))
                        .padding(.trailing)
                        .padding(.leading, 0)
                }
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}


struct SearchTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .padding(.leading, 24)
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color(.systemGray6))
            .cornerRadius(15)
    }
}


extension View {
    func searchTextFieldStyle() -> some View {
        modifier(SearchTextFieldModifier())
    }
}
