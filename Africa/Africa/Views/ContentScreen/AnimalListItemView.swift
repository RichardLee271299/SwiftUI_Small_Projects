//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Kirill Sytkov on 06.07.2022.
//

import SwiftUI

struct AnimalListItemView: View {
   //MARK: - Properties
   let animal: AnimalModel
   
   //MARK: - Body
    var body: some View {
       HStack(alignment: .center, spacing: 16) {
          Image(animal.image)
             .resizable()
             .scaledToFill()
             .frame(width: 90, height: 90)
             .cornerRadius(12)
          VStack(alignment: .leading, spacing: 8) {
             Text(animal.name)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
             
             Text(animal.headline)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding(.trailing, 8)
          } //VSTACK
       } //HSTACK
    }
}
//MARK: - Preview
struct AnimalListItemView_Previews: PreviewProvider {
   static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   
    static var previews: some View {
        AnimalListItemView(animal: animals[0])
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
