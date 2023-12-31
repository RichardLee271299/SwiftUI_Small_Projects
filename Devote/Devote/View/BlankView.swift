//
//  BlankView.swift
//  Devote
//
//  Created by Kirill Sytkov on 28.08.2022.
//

import SwiftUI

struct BlankView: View {
   var backgroundColor: Color
   var backgroundOpacity: Double
   
    var body: some View {
       VStack {
          Spacer()
       }
       .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
       .background(backgroundColor)
       .opacity(backgroundOpacity)
       .blendMode(.overlay)
       .edgesIgnoringSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
   
    static var previews: some View {
       BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
          .background(BackgroundImageView())
          .background(backgroundGradient.ignoresSafeArea(.all))
    }
}
