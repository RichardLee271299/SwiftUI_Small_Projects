//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
   let id: Int
   let name: String
   let image: String
}
