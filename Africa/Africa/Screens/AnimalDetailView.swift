//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Kirill Sytkov on 07.07.2022.
//

import SwiftUI

struct AnimalDetailView: View {
   //MARK: - Properties
   
   let animal: AnimalModel
   
   //MARK: - Body
   var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
         VStack(alignment: .center, spacing: 20) {
            // HERO IMAGE
            Image(animal.image)
               .resizable()
               .scaledToFit()
            
            //TITLE
            Text(animal.name.uppercased())
               .font(.largeTitle)
               .fontWeight(.heavy)
               .multilineTextAlignment(.center)
               .padding(.vertical, 8)
               .foregroundColor(.primary)
               .background(
                  Color.accentColor
                     .frame(height:6)
                     .offset(y: 24)
               )
            
            //HEADLINE
            Text(animal.headline)
               .font(.headline)
               .multilineTextAlignment(.leading)
               .foregroundColor(.accentColor)
               .padding(.horizontal)
            
            //GAllERY
            Group {
               HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
               InsetGalleryView(animal: animal)
            }
            .padding(.horizontal)
            
            //FACTS
            Group{
               HeadingView(headingImage: "questionmark.circle", headingText: "Did your know?")
               InsetFactView(animal: animal)
            }
            .padding(.horizontal)
            
            //DESCRIPTION
            Group {
               HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
               
               Text(animal.description)
                  .multilineTextAlignment(.leading)
                  .layoutPriority(1)
            }
            
            //MAP
            Group {
               HeadingView(headingImage: "map", headingText: "National Parks")
               
               InsetMapView()
            }
            .padding(.horizontal)
            
            //LINK
            Group {
               HeadingView(headingImage: "books.vertical", headingText: "Learn More")
               ExternalWeblinkVIew(animal: animal)
            }
            .padding(.horizontal)
         }// VSTACK
         .navigationTitle("Learn about \(animal.name)")
         .navigationBarTitleDisplayMode(.inline)
      } //SCROLL VIEW
   }
}

//MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
   static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
   static var previews: some View {
      NavigationView {
         AnimalDetailView(animal: animals[1])
      }
      
   }
}
