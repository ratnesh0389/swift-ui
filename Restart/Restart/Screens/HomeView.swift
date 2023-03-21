//
//  HomeView.swift
//  Restart
//
//  Created by Ratnesh Singh on 21/03/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardedViewActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK : - Header
            
            Spacer()
            
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
            
            // MARK : - Center
            
            Text("The time that leads to mastry is dependt on the intenseity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK : - Footer
            
            Spacer()
            
            Button {
                //Action
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//:Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
//            .padding()

            
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
