//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Kirill Sytkov on 01.07.2022.
//

import SwiftUI

struct FruitHeaderView: View {
    //MARK: - Properties
    @State private var isAnimating = false
    
    var fruit: Fruit
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimating ? 1 : 0.6)
        } // ZSTACK
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
    }
}

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
