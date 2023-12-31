//
//  RatingsSizeDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct RatingsSizeDetailView: View {
   //MARK: - Properties
   let sizes = ["XS", "S", "M", "L", "XL"]
   
   //MARK: - Body
   var body: some View {
      HStack(alignment: .top, spacing: 3) {
         //ratings
         VStack(alignment: .leading, spacing: 3) {
            Text("Ratings")
               .font(.footnote)
               .fontWeight(.semibold)
               .foregroundColor(colorGray)
            
            HStack(alignment: .center, spacing: 3) {
               ForEach(1...5, id: \.self) { item in
                  Button {
                     feedback.impactOccurred()
                  } label: {
                     Image(systemName: "star.fill")
                        .frame(width: 28, height: 28, alignment: .center)
                        .background(colorGray.cornerRadius(5))
                        .foregroundColor(.white)
                  }
                  
               }
            }
         }
         
         //sizes
         
         Spacer()
         VStack(alignment: .trailing, spacing: 3) {
            Text("Sizes")
               .font(.footnote)
               .fontWeight(.semibold)
               .foregroundColor(.gray)
            
            HStack(alignment: .center, spacing: 3) {
               ForEach(sizes, id: \.self) { size in
                  Button {
                     feedback.impactOccurred()
                  } label: {
                     Text(size)
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(colorGray)
                        .frame(width: 28, height: 28, alignment: .center)
                        .background(Color.white.cornerRadius(5))
                        .background(RoundedRectangle(cornerRadius: 5).stroke(colorGray, lineWidth: 2))
                  }
                  
               }
            }
         }
      }//hstack
   }
}

struct RatingsSizeDetailView_Previews: PreviewProvider {
   static var previews: some View {
      RatingsSizeDetailView()
         .previewLayout(.sizeThatFits)
         .padding()
   }
}
