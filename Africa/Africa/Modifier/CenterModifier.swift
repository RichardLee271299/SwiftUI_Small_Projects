//
//  CenterModifier.swift
//  Africa
//
//  Created by Kirill Sytkov on 15.07.2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
   func body(content: Content) -> some View {
      HStack{
         Spacer()
         content
         Spacer()
      }
   }
}
