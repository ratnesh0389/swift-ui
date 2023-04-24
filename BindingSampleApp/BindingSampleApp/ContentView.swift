//
//  ContentView.swift
//  BindingSampleApp
//
//  Created by Ratnesh Singh on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Binding Demo")
                .font(.largeTitle)
                .foregroundColor( isOn ?  .blue : .gray)
            Text("Ratnesh Singh")
                .font(.subheadline)
                .foregroundColor(isOn ? .yellow : .green)
            ToggleChildView(isOn: $isOn)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
