//
//  AnimalModel.swift
//  Africa
//
//  Created by Kirill Sytkov on 06.07.2022.
//

import Foundation

struct AnimalModel:Codable, Identifiable {
   let id: String
   let name: String
   let headline: String
   let description: String
   let link: String
   let image: String
   let gallery: [String]
   let fact: [String]
}
