//
//  GalleryVIew.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI

struct GalleryVIew: View {
   //MARK: - Properties
   @State private var selectedAnimal: String = "lion"
   
   let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   let haptics = UIImpactFeedbackGenerator(style: .medium)
   
//   let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
   
   @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
   @State private var gridColumn: Double = 3
   
   //MARK: - FUNCS
   private func gridSwitch() {
      gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
   }
   
   
   //MARK: - Body
    var body: some View {
       ScrollView(.vertical, showsIndicators: false) {
          //IMAGE
          Image(selectedAnimal)
             .resizable()
             .scaledToFit()
             .clipShape(Circle())
             .overlay(Circle().stroke(Color.white, lineWidth: 8))
          
          //SLIDER
          Slider(value: $gridColumn, in: 2...4, step: 1)
             .padding(.horizontal)
             .onChange(of: gridColumn) { newValue in
                gridSwitch()
             }
          
          //GRID
          VStack(alignment: .center, spacing: 30) {
             LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { item in
                   Image(item.image)
                      .resizable()
                      .scaledToFit()
                      .clipShape(Circle())
                      .overlay(Circle().stroke(Color.white, lineWidth: 1))
                      .onTapGesture {
                         selectedAnimal = item.image
                         haptics.impactOccurred()
                      }
                }// LOOP
             } //GRID
             .animation(.easeIn)
             .onAppear {
                gridSwitch()
             }
          }//VSTACK
          .padding(.horizontal, 10)
          .padding(.vertical, 50)
       }// SCROLL
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(MotionAnimationView())
    }
}

struct GalleryVIew_Previews: PreviewProvider {
    static var previews: some View {
        GalleryVIew()
    }
}
