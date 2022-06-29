//
//  OnboardingView.swift
//  Fructus
//
//  Created by Kirill Sytkov on 29.06.2022.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(0..<5) { item in
                FruitCardView()
            }
        }// Tab
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}
//MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
