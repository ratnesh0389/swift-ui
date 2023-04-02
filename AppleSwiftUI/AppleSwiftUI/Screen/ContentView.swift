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
            MapView()
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircleImageView()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                
                    Text("Turtle Rock!")
                        .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park!")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)


                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
