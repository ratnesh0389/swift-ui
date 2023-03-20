//
//  ContentView.swift
//  HelloWorld
//
//  Created by Ratnesh Singh on 21/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Ratnesh This is your first app.!")
            Link("Go to Apple",
            destination: URL(string: "https://developer.apple.com/")!)
            .border(.red)
            
            Link("Send An Email",
            destination: URL(string: "mailto:test@test.test")!)
//            .border(.red)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
