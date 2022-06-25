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
    
    //MARK: - Body
    var body: some View {
        VStack(spacing:20){
            Text("onBoarding")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardngViewActive = false
            }) {
                Text("Start")
            }
 
        }// VSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
