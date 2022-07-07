//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Kirill Sytkov on 07.07.2022.
//

import SwiftUI

struct InsetGalleryView: View {
   //MARK: - Properties
   let animal: AnimalModel
   //MARK: - Body
    var body: some View {
       ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .center, spacing: 15) {
             ForEach(animal.gallery, id: \.self) { item in
                Image(item)
                   .resizable()
                   .scaledToFit()
                   .frame(height:200)
                   .cornerRadius(12)
             } //LOOP
          } // HSTACK
       } //SCROLL
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
   static let animal: [AnimalModel] = Bundle.main.decode("animals.json")
   
    static var previews: some View {
        InsetGalleryView(animal: animal[1])
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
