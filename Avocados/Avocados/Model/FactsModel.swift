//
//  FactsModel.swift
//  Avocados
//
//  Created by Kirill Sytkov on 05.11.2022.
//

import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
