//
//  ContentView.swift
//  LoginSameple
//
//  Created by Ratnesh Singh on 23/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userName: String = String()
    @State private var userPassword: String = String()
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            Text("Explore Swift UI with Ratnesh!")
                .font(.subheadline)
                .padding()
            
            TextField("User Name", text: $userName)
                .padding()
                .background(.gray)
                .cornerRadius(6)
            SecureField("Password", text: $userPassword)
                .padding()
                .background(.gray)
                .cornerRadius(6)
            
            HStack {
                Button("Login") {
                    print("Button Clicked: \(userName)")
                }
                .disabled(userName.count < 4)
                .padding()
                
                Spacer()
                
                Button("Forgot Password!") {
                    print("Forgot Password: \(userPassword)")
                }
                .disabled(userName.count < 4)
                .padding()
            }
            .padding()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
