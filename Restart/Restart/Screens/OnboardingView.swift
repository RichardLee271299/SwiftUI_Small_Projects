//
//  OnboardingView.swift
//  Restart
//
//  Created by Kirill Sytkov on 25.06.2022.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    @AppStorage("onboarding") var isOnboardngViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing:20){
                
                //MARK: - Header
                Spacer()
                
                VStack(spacing: 0) {
                    
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                    It's not how much we give but
                    how much love me put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } // Header
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                //MARK: - Center
                ZStack { 
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0.5)
                        .offset(x: isAnimating ? 0 : 100)
                        .animation(.easeOut(duration: 0.6), value: isAnimating)
                        
                    
                } //Center
                .animation(.easeOut(duration: 1), value: isAnimating)
//
                Spacer()
                
                //MARK: - Footer
                ZStack {
                    // Parts of the custom button
                    //1. Background (static)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    //2. Call-to-action (static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    //3. Capsule (dynamic width)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    //4. Circle (draggable)
                    HStack {
                        ZStack{
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ gesture in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardngViewActive = false
                                        } else {
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        ) //Gesture
                        Spacer()
                    }// HStack
                    
                }// Footer
                .frame(width: buttonWidth,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            } // VStack
        }// ZStack
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
