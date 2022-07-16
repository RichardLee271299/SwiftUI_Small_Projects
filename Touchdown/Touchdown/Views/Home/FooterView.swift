//
//  FooterView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 16.07.2022.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
       VStack {
          Text("We offer the most cutting edge, comfortable, lightweght and durable football helmets in the market at affordable prices.")
             .foregroundColor(.gray)
             .multilineTextAlignment(.center)
             .layoutPriority(2)
          
          Image("logo-lineal")
             .renderingMode(.template)
             .foregroundColor(.gray)
             .layoutPriority(0)
          
          Text("Copyright © Kirill Sytkov\nAll right reserved.")
             .font(.footnote)
             .fontWeight(.bold)
             .foregroundColor(.gray)
             .multilineTextAlignment(.center)
             .layoutPriority(1)
          
       } //VSTACK
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
          .previewLayout(.sizeThatFits)
          .background(colorBackground)
    }
}
