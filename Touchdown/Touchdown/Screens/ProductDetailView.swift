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
             .padding(
               .horizontal)
          
          //detail bottom part
          //ratings + sizes
          //description
          //quantity + favorite
          //add to cart
          Spacer()
       }// vstack
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
