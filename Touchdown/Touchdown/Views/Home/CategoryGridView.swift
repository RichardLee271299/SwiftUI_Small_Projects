//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct CategoryGridView: View {
   var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
         LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
            Section(content: {
               ForEach(categories) { category in
                  CategoryItemView(category: category)
               } //LOOP
            }, header: {
               SectionView(rotateClockwise: false)
            }, footer: {
               SectionView(rotateClockwise: true)
            }) //SECTION
         }// GRID
         .frame(height: 140)
         .padding(.horizontal, 15)
         .padding(.vertical, 10)
      }// SCROLL
   }
}

struct CategoryGridView_Previews: PreviewProvider {
   static var previews: some View {
      CategoryGridView()
         .previewLayout(.sizeThatFits)
         .padding()
         .background(colorBackground)
      
   }
}
