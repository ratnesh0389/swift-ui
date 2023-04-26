//
//  ContentView.swift
//  ObservableObjectProtocolSample
//
//  Created by Ratnesh Singh on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var user: User = User()
    
    var body: some View {
        VStack {
            Text("User name is: \(user.name)")
                .padding()
            
            TextField("User name", text: $user.name)
                .textFieldStyle(.roundedBorder)
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
