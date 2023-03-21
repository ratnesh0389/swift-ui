//
//  HomeView.swift
//  Restart
//
//  Created by Ratnesh Singh on 21/03/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardedViewActive: Bool = false
    @State private var isAnimation:Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK : - Header
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimation ? 35 : -35)
                    .animation(
                        .easeOut(duration: 4)
                        .repeatForever() ,
                        value: isAnimation
                    )
            }
            
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
                withAnimation {
                    isOnboardedViewActive = true
                }
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
        } //:VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimation = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
