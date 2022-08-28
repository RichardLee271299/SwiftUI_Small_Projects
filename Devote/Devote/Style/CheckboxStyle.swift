//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Kirill Sytkov on 28.08.2022.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
   func makeBody(configuration: Configuration) -> some View {
      return HStack {
         Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
            .foregroundColor(configuration.isOn ? .pink : .primary)
            .font(.system(size: 30, weight: .semibold, design: .rounded))
            .onTapGesture {
               configuration.isOn.toggle()
            }
         configuration.label
      }
   }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
       Toggle("Placceholder label", isOn: .constant(false))
          .toggleStyle(CheckboxStyle())
          .padding()
          .previewLayout(.sizeThatFits)
    }
}
