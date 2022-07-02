//
//  ContentView.swift
//  Fructus
//
//  Created by Kirill Sytkov on 29.06.2022.
//

import SwiftUI

struct ContentView: View {
   //MARK: - Properties
   @State private var isShowingSettings = false
   
   var fruits: [Fruit] = fruitsData
   
   //MARK: - Body
   var body: some View {
      NavigationView {
         List {
            ForEach(fruits.shuffled()) { item in
               NavigationLink(destination: FruitDetailView(fruit: item)) {
                  FruitRowView(fruit: item)
                     .padding(.vertical, 4)
               }
            }
         }
         .navigationTitle("Fruits")
         .navigationBarItems(
            trailing:
               Button(action: {
                  isShowingSettings = true
               }) {
                  Image(systemName: "slider.horizontal.3")
               }
               .sheet(isPresented: $isShowingSettings) {
                  SettingsView()
               }
         )
      } // Navigation
      .navigationViewStyle(StackNavigationViewStyle())
   }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView(fruits: fruitsData)
      
   }
}
