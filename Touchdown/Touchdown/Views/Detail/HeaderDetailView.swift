//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct HeaderDetailView: View {
    var body: some View {
       VStack(alignment: .leading, spacing: 6) {
          Text("Protective Gear")
          Text(sampleProduct.name)
             .font(.largeTitle)
             .fontWeight(.black)
       }// vstack
       .foregroundColor(.white)
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView()
          .previewLayout(.sizeThatFits)
          .padding()
          .background(colorBackground)
    }
}
