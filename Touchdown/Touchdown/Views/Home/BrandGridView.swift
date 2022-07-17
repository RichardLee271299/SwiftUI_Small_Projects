//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
       ScrollView(.horizontal, showsIndicators: false) {
          LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
             ForEach(brands) { brand in
                BrandItemView(brand: brand)
             }// loop
          }//grid
          .frame(height: 200)
          .padding(15)
       }// scroll
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
       BrandGridView()
          .previewLayout(.sizeThatFits)
          .background(colorBackground)
       
    }
}
