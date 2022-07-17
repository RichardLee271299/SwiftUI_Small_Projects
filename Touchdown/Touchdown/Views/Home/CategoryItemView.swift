//
//  CategoryItemView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct CategoryItemView: View {
   //MARK: - Properties
   let category: CategoryModel
   
   //MARK: - Body
   var body: some View {
      Button {
         //
      } label: {
         HStack(alignment: .center, spacing: 6) {
            Image(category.image)
               .renderingMode(.template)
               .resizable()
               .scaledToFit()
               .frame(width: 30, height: 30, alignment: .center)
               .foregroundColor(.gray)
            
            Text(category.name.uppercased())
               .fontWeight(.light)
               .foregroundColor(.gray)
            
            Spacer()
         }// HSTACK
         .padding()
         .background(Color.white.cornerRadius(12))
         .background(
            RoundedRectangle(cornerRadius: 12)
               .stroke(.gray, lineWidth: 1)
         )
         
      }// BUTTON
   }
}

struct CategoryItemView_Previews: PreviewProvider {
   static var previews: some View {
      CategoryItemView(category: categories[0])
         .previewLayout(.sizeThatFits)
         .padding()
         .background(colorBackground)
   }
}
