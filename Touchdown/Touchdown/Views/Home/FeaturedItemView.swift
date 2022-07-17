//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import SwiftUI

struct FeaturedItemView: View {
   //MARK: - Properties
   let player: PlayerModel
   
   //MARK: - Body
    var body: some View {
       Image(player.image)
          .resizable()
          .cornerRadius(12)
          .scaledToFit()
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
   
    static var previews: some View {
        FeaturedItemView(player: players[0])
          .previewLayout(.sizeThatFits)
          .padding()
          .background(colorBackground)
    }
}
