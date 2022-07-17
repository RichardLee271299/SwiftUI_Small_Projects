//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct NavigationBarDetailView: View {
   //MARK: - Propeties
   @EnvironmentObject var shop: Shop
   
   //MARK: - body
    var body: some View {
       HStack {
          Button {
             feedback.impactOccurred()
             withAnimation(.easeIn) {
                shop.showingProduct = false
                shop.selectedProduct = nil
             }
          } label: {
             Image(systemName: "chevron.left")
                .font(.title)
                .foregroundColor(.white)
          }
          Spacer()
          Button {
             feedback.impactOccurred()
          } label: {
             Image(systemName: "cart")
                .font(.title)
                .foregroundColor(.white)
          }

          
       }
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
          .environmentObject(Shop())
          .previewLayout(.sizeThatFits)
          .padding()
          .background(colorBackground)
    }
}
