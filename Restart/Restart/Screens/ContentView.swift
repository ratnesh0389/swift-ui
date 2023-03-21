//
//  ContentView.swift
//  Restart
//
//  Created by Ratnesh Singh on 21/03/23.
//

import SwiftUI

struct ContentView: View {
    /*
     @AppStorage: PropertyWrapper: It's live userdefaults under the hood.
     It's purpose to store value on device permanent storeage.
     onboarded: Unique Identifier
     proepryName =
     value
     */
    @AppStorage("onboarding") var isOnboardedViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardedViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
