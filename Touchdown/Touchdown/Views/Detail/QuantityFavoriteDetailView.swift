//
//  QuantityFavoriteDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
   //MARK: - Properties
   @State private var counter: Int = 0
   @State private var favorite = false
   //MARK: - Body
    var body: some View {
       HStack(alignment: .center, spacing: 6) {
          Button {
             if counter > 0 {
                counter -= 1
             }
          } label: {
              Image(systemName: "minus.circle")
          }//Button
          Text("\(counter)")
             .fontWeight(.semibold)
             .frame(minWidth:36)
          Button {
             counter += 1
          } label: {
             Image(systemName: "plus.circle")
          }
          
          Spacer()
          
          Button {
             favorite.toggle()
          } label: {
             Image(systemName: "heart.circle")
                .foregroundColor(favorite ? .pink : .gray)
          }

       }//Hstack
       .font(.system(.title,design: .rounded))
       .foregroundColor(.black)
       .imageScale(.large)
    }
}

struct QuantityFavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavoriteDetailView()
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
