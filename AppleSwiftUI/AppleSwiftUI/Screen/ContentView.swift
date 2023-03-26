//
//  ContentView.swift
//  AppleSwiftUI
//
//  Created by Ratnesh Singh on 26/03/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    
    // MARK: - Functions

    var body: some View {
        //To customize a SwiftUI view, you call methods called modifiers.
    
        VStack(alignment: .leading){
            Text("Turtle Rock!")
                    .font(.title)
            HStack {
                Text("Joshua Tree National Park!")
                    .font(.subheadline)
                
                Spacer()
                
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
