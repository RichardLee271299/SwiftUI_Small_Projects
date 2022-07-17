//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct AddToCartDetailView: View {
   //MARK: - Properties
   
   
   //MARK: - Body
    var body: some View {
       Button {
          
       } label: {
          Spacer()
          Text("Add to cart".uppercased())
             .font(.system(.title2, design: .rounded))
             .fontWeight(.bold)
             .foregroundColor(.white)
          Spacer()
       }// button
       .padding(15)
       .background(Color(red: sampleProduct.red, green: sampleProduct.green, blue: sampleProduct.blue))
       .clipShape(Capsule())

    }
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
