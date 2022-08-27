//
//  HideKeyboard + extension.swift
//  Devote
//
//  Created by Kirill Sytkov on 27.08.2022.
//

import SwiftUI

#if canImport(UIKit)
extension View {
   func hideKeyboard() {
      UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }
}
#endif
