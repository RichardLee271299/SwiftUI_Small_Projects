//
//  HomeView.swift
//  Restart
//
//  Created by Kirill Sytkov on 25.06.2022.
//

import SwiftUI

struct HomeView: View {
    //MARK: - Properties
    @AppStorage("onboarding") var isOnboardngViewActive: Bool = false
    
    @State private var isAnimating: Bool = false
    
    //MARK: - Body
    var body: some View {
        VStack(spacing:20) {
            //MARK: - Header
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .blue, shapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }
            
            //MARK: - Center
            
            Text("The time that leads to mastery is dependent on the intesity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //MARK: - Footer
            Spacer()
            
            Button(action: {
                withAnimation {
                    isOnboardngViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
