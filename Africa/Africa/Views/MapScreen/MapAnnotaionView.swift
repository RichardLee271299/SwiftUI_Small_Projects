//
//  MapAnnotaionView.swift
//  Africa
//
//  Created by Kirill Sytkov on 09.07.2022.
//

import SwiftUI
import MapKit

struct MapAnnotaionView: View {
   //MARK: - Propeties
   @State private var animation: Double = 0.0
   
   var location: LocationModel
   
   //MARK: - Body
   var body: some View {
      ZStack {
         Circle()
            .fill(Color.accentColor)
            .frame(width: 54, height: 54, alignment: .center)
         
         Circle()
            .stroke(Color.accentColor, lineWidth: 2)
            .frame(width: 52, height: 52, alignment: .center)
            .scaleEffect(1 + CGFloat(animation))
            .opacity(1 - animation)
         Image(location.image)
            .resizable()
            .scaledToFit()
            .frame(width: 48, height:48,  alignment: .center)
            .clipShape(Circle())
      } //ZSTACK
      .onAppear {
         withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
            animation = 1
         }
      }
   }
}

//MARK: - Preview
struct MapAnnotaionView_Previews: PreviewProvider {
   static let locations: [LocationModel] = Bundle.main.decode("locations.json")
   
   static var previews: some View {
      MapAnnotaionView(location: locations[0])
         .previewLayout(.sizeThatFits)
         .padding()
   }
}
