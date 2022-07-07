//
//  InsetFactView.swift
//  Africa
//
//  Created by Kirill Sytkov on 07.07.2022.
//

import SwiftUI

struct InsetFactView: View {
   //MARK: - Properties
   let animal: AnimalModel
   
   //MARK: - Body
    var body: some View {
       GroupBox {
          TabView {
             ForEach(animal.fact, id: \.self ) { item in
                Text(item)
             }
          } // TABS
          .tabViewStyle(.page)
          .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
       } // BOX
    }
}

//MARK: - Preview
struct InsetFactView_Previews: PreviewProvider {
   static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   
    static var previews: some View {
        InsetFactView(animal: animals[0])
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
