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
    
    //MARK: - Body
    var body: some View {
        VStack(spacing:20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardngViewActive = true
            }) {
                Text("Restart")
            }
        } //VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
