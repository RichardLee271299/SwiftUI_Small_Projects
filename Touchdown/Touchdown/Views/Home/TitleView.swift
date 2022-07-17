//
//  TitleView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct TitleView: View {
   //MARK: - Properties
   var title: String
   
    var body: some View {
       HStack {
          Text(title)
             .font(.largeTitle)
             .fontWeight(.heavy)
          
          Spacer()
       } //HSTACK
       .padding(.horizontal)
       .padding(.top, 15)
       .padding(.bottom, 10)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Helmet")
          .previewLayout(.sizeThatFits)
          .background(colorBackground)
    }
}
