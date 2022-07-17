//
//  Shop.swift
//  Touchdown
//
//  Created by Kirill Sytkov on 17.07.2022.
//

import Foundation

class Shop: ObservableObject {
   @Published var showingProduct: Bool = false
   @Published var selectedProduct: ProductModel? = nil
}
