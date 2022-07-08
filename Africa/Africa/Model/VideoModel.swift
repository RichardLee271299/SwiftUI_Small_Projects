//
//  VideoModel.swift
//  Africa
//
//  Created by Kirill Sytkov on 08.07.2022.
//

import Foundation

struct VideoModel: Codable, Identifiable {
   let id: String
   let name: String
   let headline: String
   
   //Computed Property
   var thumbnail: String {
      "video-\(id)"
   }
   
}
