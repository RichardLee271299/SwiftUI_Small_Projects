//
//  CoverImageView.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI

struct CoverImageView: View {
   //MARK: - Properties
   let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
   
   //MARK: - Body
    var body: some View {
       TabView {
          ForEach(coverImages) { item in
             Image(item.name)
                .resizable()
             .scaledToFill()
          } // LOOP
       } //TAB
       .tabViewStyle(.page)
    }
}

//MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
       CoverImageView()
          .previewLayout(.fixed(width: 400, height: 300))
    }
}
