//
//  MapView.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
   //MARK: - Properties
   @State private var region: MKCoordinateRegion = {
      var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
      var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
      var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
      
      return mapRegion
   }()
   
   let locations: [LocationModel] = Bundle.main.decode("locations.json")
   
   //MARK: - Body
    var body: some View {
       //MARK: - 1 Basic Mpa
//        Map(coordinateRegion: $region)
       //MARK: - 2 ADVANCED MAP
       Map(coordinateRegion: $region, annotationItems: locations) { item in
          // old style (always static)
//          MapPin(coordinate: item.location, tint: .accentColor)
          
          // Markers new style (always static)
//          MapMarker(coordinate: item.location, tint: .accentColor)
          
          // Custom basic annotaion ( it could be interactive)
          MapAnnotation(coordinate: item.location) {
             Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32, alignment: .center)
          } //ANNOTAION
          
       }
    }
}

//MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
