//
//  ContentView.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
   //MARK: - Properties
   let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   
   //MARK: - Body
    var body: some View {
       NavigationView {
          List {
             CoverImageView()
                .frame(height:300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
             ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                   AnimalListItemView(animal: animal)
                }
             }
          } // LIST
          .navigationTitle("Africa")
          .navigationBarTitleDisplayMode(.large)
       } //NAVIGATION
       .navigationViewStyle(.stack)
    }
}
//MARK: -  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
