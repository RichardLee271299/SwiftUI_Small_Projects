//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Kirill Sytkov on 28.08.2022.
//

import SwiftUI

struct BackgroundImageView: View {
   var body: some View {
      Image("rocket")
         .antialiased(true)
         .resizable()
         .scaledToFill()
         .ignoresSafeArea(.all)
   }
}

struct BackgroundImageView_Previews: PreviewProvider {
   static var previews: some View {
      BackgroundImageView()
   }
}
