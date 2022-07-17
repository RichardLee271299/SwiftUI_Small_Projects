//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct ProductDetailView: View {
   //MARK: - Properties
   
   //MARK: - Body
   var body: some View {
      VStack(alignment: .leading, spacing: 5) {
         //navbar
         NavigationBarDetailView()
            .padding(.horizontal)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
         //header
         HeaderDetailView()
            .padding(.horizontal)
         
         //detail top part
         TopPartDetailView()
            .padding(.horizontal)
            .zIndex(1)
         
         //detail bottom part
         VStack(alignment: .center, spacing: 0) {
            //ratings + sizes
            RatingsSizeDetailView()
               .padding(.top, -20)
               .padding(.bottom, 10)
            
            //description
            ScrollView(.vertical, showsIndicators: false) {
               Text(sampleProduct.description)
                  .font(.system(.body, design: .rounded))
                  .foregroundColor(.gray)
                  .multilineTextAlignment(.leading)
            }
            
            //quantity + favorite
            QuantityFavoriteDetailView()
               .padding(.vertical, 10)
            
            //add to cart
            AddToCartDetailView()
               .padding(.bottom,20)
            
            Spacer()
         }// VSTACK
         
         .padding(.horizontal)
         .background(Color.white.clipShape(CustomShape())
            .padding(.top, -105))
      }// vstack
      .zIndex(0)
      .ignoresSafeArea(.all, edges: .all)
      .background(Color(red: sampleProduct.red, green: sampleProduct.green, blue: sampleProduct.blue))
      .ignoresSafeArea(.all, edges: .all)
   }
}

//MARK: - Preview
struct ProductDetailView_Previews: PreviewProvider {
   static var previews: some View {
      ProductDetailView()
         .previewLayout(.fixed(width: 375, height: 812))
   }
}
