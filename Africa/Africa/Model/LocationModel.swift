//
//  LocationModel.swift
//  Africa
//
//  Created by Kirill Sytkov on 09.07.2022.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
   let id: String
   let name: String
   let image: String
   let latitude: Double
   let longitude: Double
   
   // Computed Property
   var location: CLLocationCoordinate2D {
      CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
   }
}
