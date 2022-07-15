//
//  ContentView.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
   //MARK: - Properties
   @State private var isGridViewActive = false
   
   @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
   @State private var gridColumn: Int = 1
   @State private var toolbarIcon = "square.grid.2x2"
   
   let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   let haptics = UIImpactFeedbackGenerator(style: .medium)
   
   //MARK: - flow func
   private func gridSwitch() {
      gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
      gridColumn = gridLayout.count
      
      switch gridColumn {
      case 1:
         toolbarIcon = "square.grid.2x2"
      case 2:
         toolbarIcon = "square.grid.3x2"
      case 3:
         toolbarIcon = "rectangle.grid.1x2"
      default:
         toolbarIcon = "square.grid.2x2"
      }
   }
   
   //MARK: - Body
    var body: some View {
       NavigationView {
          Group {
             if !isGridViewActive {
                List {
                   CoverImageView()
                      .frame(height:300)
                      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                   ForEach(animals) { animal in
                      NavigationLink(destination: AnimalDetailView(animal: animal)) {
                         AnimalListItemView(animal: animal)
                      } // LINK
                   } //LOOP
                } //LIST
             } else {
                ScrollView(.vertical, showsIndicators: false) {
                   LazyVGrid(columns: gridLayout,alignment: .center, spacing: 12) {
                      ForEach(animals) { animal in
                         NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            GridItemView(animal: animal)
                         } // LINK
                      } // LOOP
                   }// GRID
                   .padding(10)
                   .animation(.easeIn)
                }//SCROLL
             } // CONDITION
          } //GROUP
          .navigationTitle("Africa")
          .navigationBarTitleDisplayMode(.large)
          .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing:16) {
                   //LIST
                   Button {
                      isGridViewActive = false
                      haptics.impactOccurred()
                   } label: {
                      Image(systemName: "square.fill.text.grid.1x2")
                         .font(.title2)
                         .foregroundColor(isGridViewActive ? .primary : .accentColor)
                   }
                   
                   //GRID
                   Button {
                      isGridViewActive = true
                      haptics.impactOccurred()
                      gridSwitch()
                   } label: {
                      Image(systemName: toolbarIcon)
                         .font(.title2)
                         .foregroundColor(isGridViewActive ? .accentColor : .primary)
                   }


                }
             }
          } // TOOLBAR
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
