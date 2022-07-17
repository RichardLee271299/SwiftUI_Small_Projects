//
//  ProductModel.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import Foundation

struct ProductModel: Codable, Identifiable {
   let id: Int
   let name: String
   let image: String
   let price: Int
   let description: String
   let color: [Double]
   
   var red: Double { color[0]}
   var green: Double { color[1]}
   var blue: Double { color[2]}
   
   var formattedPrice: String { return "$\(price)"}
}
