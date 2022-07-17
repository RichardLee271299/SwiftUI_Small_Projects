//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct NavigationBarDetailView: View {
    var body: some View {
       HStack {
          Button {
             //
          } label: {
             Image(systemName: "chevron.left")
                .font(.title)
                .foregroundColor(.white)
          }
          Spacer()
          Button {
             //
          } label: {
             Image(systemName: "cart")
                .font(.title)
                .foregroundColor(.white)
          }

          
       }
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
          .previewLayout(.sizeThatFits)
          .padding()
          .background(colorBackground)
    }
}
