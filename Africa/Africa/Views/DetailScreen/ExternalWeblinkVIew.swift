//
//  ExternalWeblinkVIew.swift
//  Africa
//
//  Created by Kirill Sytkov on 07.07.2022.
//

import SwiftUI

struct ExternalWeblinkVIew: View {
   //MARK: - Properties
   let animal: AnimalModel
   
   //MARK: - Body
    var body: some View {
       GroupBox {
          HStack {
             Image(systemName: "globe")
             Text("Wikipedia")
             Spacer()
             
             Group {
                Image(systemName: "arrow.up.right.square")
                
                Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
             }
             .foregroundColor(.accentColor)
          }
       } //BOX
    }
}

//MARK: - Preview
struct ExternalWeblinkVIew_Previews: PreviewProvider {
   static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   
    static var previews: some View {
        ExternalWeblinkVIew(animal: animals[0])
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
