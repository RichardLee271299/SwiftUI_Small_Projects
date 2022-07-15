//
//  GridItemView.swift
//  Africa
//
//  Created by Kirill Sytkov on 15.07.2022.
//

import SwiftUI

struct GridItemView: View {
   //MARK: - Properties
   let animal: AnimalModel
   
   //MARK: - Body
    var body: some View {
       Image(animal.image)
          .resizable()
          .scaledToFit()
          .cornerRadius(12)
    }
}

//MARK: - Preview
struct GridItemView_Previews: PreviewProvider {
   static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        GridItemView(animal: animals[0])
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
