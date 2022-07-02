//
//  SettingLabelView.swift
//  Fructus
//
//  Created by Kirill Sytkov on 02.07.2022.
//

import SwiftUI

struct SettingLabelView: View {
   //MARK: - Properties
   var labelText: String
   var labelImage: String
   
   //MARK: - Body
    var body: some View {
       HStack {
          Text(labelText.uppercased()).fontWeight(.bold)
          Spacer()
          Image(systemName: labelImage)
       }
    }
}
//MARK: - Preview
struct SettingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingLabelView(labelText: "Fructus", labelImage: "info.circle")
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
