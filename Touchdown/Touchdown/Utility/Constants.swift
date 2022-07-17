//
//  Constants.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 16.07.2022.
//

import SwiftUI

// DATA
let players: [PlayerModel] = Bundle.main.decode("player.json")
let categories: [CategoryModel] = Bundle.main.decode("category.json")

//COLOR
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

//LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
   Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

//UX

//API

//IMAGE

//FONT

//STRING

//MISC
