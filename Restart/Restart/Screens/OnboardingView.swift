//
//  OnboardingView.swift
//  Restart
//
//  Created by Ratnesh Singh on 21/03/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: Property
    
    @AppStorage("onboarding") var isOnboardedViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffSet: CGFloat = 0
    
    @State private var isAnimating: Bool = false
    @State private var imageOffSet: CGSize = .zero
//    @State private var imageOffSet: CGSize = CGSize(width: 0, height: 0)
    
    // MARK: Body
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                
                //MARK: Header
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }//: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 1 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                //MARK: Center
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffSet.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffSet.width / 20))) //Add image rotations in degree.
                        .gesture(DragGesture()
                            .onChanged { gesture in
                                if abs(imageOffSet.width) <= 150 {
                                    imageOffSet = gesture.translation
                                }
                            }
                            .onEnded{_ in
                                imageOffSet = .zero
                            }
                        )//:Gesture
                        .animation(.easeOut(duration: 1), value: imageOffSet)
                } //:CENTER

                Spacer()

                //MARK: Footer
                
                ZStack {
                    //Part of custom button.
                    
                    //1. Backgrouund (Static)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    //2. Call-to-action (Static)

                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                        
                    //3. Capsule (Dunamic width)

                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffSet + 80)
                        
                        Spacer()
                    }
                    
                    //4. Circle(Dragable)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: buttonOffSet)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                if gesture.translation.width > 0 && buttonOffSet <= buttonWidth - 80 {
                                    buttonOffSet = gesture.translation.width
                                }
                            }
                            .onEnded {_ in
                                withAnimation(Animation.easeOut(duration: 0.4)) {
                                    if buttonOffSet > buttonWidth / 2 {
                                        buttonOffSet = buttonWidth - 80
                                        isOnboardedViewActive = false
                                    } else {
                                        buttonOffSet = 0
                                    }
                                }
                            }
                    )//: GESTURE
                        
                        Spacer()
                    }//:HSTACK
                    
                }.frame(width: buttonWidth, height: 80, alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 1.0), value: isAnimating)
                
            }//:VSTACK
        }//:ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
