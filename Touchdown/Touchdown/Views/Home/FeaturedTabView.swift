//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
       TabView {
          ForEach(players) { player in
             FeaturedItemView(player: player)
                .padding(.top, 10)
                .padding(.horizontal, 15)
                
          }
       } //TAB
       .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
          .previewDevice("IPhone 12 Pro")
          .background(Color.gray)
    }
}
