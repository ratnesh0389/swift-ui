//
//  ContentView.swift
//  Pinch
//
//  Created by Ratnesh Singh on 22/03/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    // MARK: - Function
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    //MMARK: - Content
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                // MARK : 1. Tap gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else  {
                            resetImageState()
                        }
                    }
                // MARK : 2. Drag gesture
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            })
                            .onEnded({ _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            })
                    )
            }//ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
        }//:NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
