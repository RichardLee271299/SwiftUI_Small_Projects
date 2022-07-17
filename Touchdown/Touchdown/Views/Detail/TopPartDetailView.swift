//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct TopPartDetailView: View {
   //MARK: - Properties
   @State private var isAnimating = false
   
   //MARK: - Body
    var body: some View {
       HStack(alignment: .center, spacing: 6) {
          //price
          VStack(alignment: .leading, spacing: 6) {
             Text("Price")
                .fontWeight(.semibold)
             
             Text(sampleProduct.formattedPrice)
                .font(.largeTitle)
                .fontWeight(.black)
                .scaleEffect(1.35, anchor: .leading)
          }
          .offset( y: isAnimating ? -50 : -75)
          
          Spacer()
          Image(sampleProduct.image)
             .resizable()
             .scaledToFit()
             .offset( y: isAnimating ? 0 : -35)
          //photo
       }//Hstack
       .onAppear {
          withAnimation(.easeOut(duration: 0.75)) {
             isAnimating.toggle()
          }
       }
    }
}

struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
