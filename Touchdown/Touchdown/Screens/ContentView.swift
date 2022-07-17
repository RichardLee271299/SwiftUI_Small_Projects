//
//  ContentView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 16.07.2022.
//

import SwiftUI

struct ContentView: View {
   //MARK: - Properties
   
   
   //MARK: - Body
   var body: some View {
      ZStack {
         VStack(spacing: 0) {
            NavigationBarView()
               .padding(.horizontal, 15)
               .padding(.bottom)
               .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
               .background(Color.white)
               .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            ScrollView(.vertical, showsIndicators: false) {
               FeaturedTabView()
                  .frame(height: UIScreen.main.bounds.width / 1.5) // This will fix the layout rendering priority issue by using the screen's aspect ratio.
                  .padding(.vertical, 20)
               
               CategoryGridView()
               LazyVGrid(columns: gridLayout, spacing: 15) {
                  ForEach(products) { product in
                     ProductItemView(product: product)
                  }//LOOP
               }//GRID
               .padding(15)
               
               TitleView(title: "Helmets")
               
               FooterView()
                  .padding(.horizontal)
            }
            
         } //VSTACK
         .background(colorBackground.ignoresSafeArea(.all, edges: .all))
      }//ZSTACK
      .ignoresSafeArea(.all,edges: .top)
   }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
         
   }
}
