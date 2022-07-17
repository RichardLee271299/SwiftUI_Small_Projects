//
//  SectionView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct SectionView: View {
   //MARK: - Properties
   
   @State var rotateClockwise: Bool
   
   var body: some View {
      VStack {
         Spacer()
         Text("Categories".uppercased())
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
         Spacer()
      } //VSTACk
      .background(colorGray.cornerRadius(12))
      .frame(width: 85)
      
   }
}

struct SectionView_Previews: PreviewProvider {
   static var previews: some View {
      SectionView(rotateClockwise: true)
         .padding()
         .previewLayout(.fixed(width: 120, height: 240))
         .background(colorBackground)
   }
}
