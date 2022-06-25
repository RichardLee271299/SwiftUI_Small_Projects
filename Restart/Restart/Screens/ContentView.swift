//
//  ContentView.swift
//  Restart
//
//  Created by Kirill Sytkov on 25.06.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @AppStorage("onboarding") var isOnboardngViewActive: Bool = true
    
    //MARK: - Body
    var body: some View {
        ZStack {
            if isOnboardngViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }// ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
