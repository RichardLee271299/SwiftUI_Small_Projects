//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Kirill Sytkov on 02.07.2022.
//

import SwiftUI

struct SettingsRowView: View {
   //MARK: - Properties
   var name: String
   var content: String? = nil
   var linkLabel: String? = nil
   var linkDestionation: String? = nil
   //MARK: - Body
    var body: some View {
       VStack {
          Divider().padding(.vertical, 4)
          HStack {
             Text(name).foregroundColor(Color.gray)
             Spacer()
             if let content = content {
                Text(content)
             }
             if let linkLabel = linkLabel {
                if let linkDestionation = linkDestionation {
                   let url = "https://\(linkDestionation)"
                   Link(linkLabel, destination: URL(string: url)!)
                   Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }
             }
          } // HSTACK
       } // VSTACK
    }
}
//MARK: - Preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
       Group {
          SettingsRowView(name: "Developer", content: "John / Jane")
             .previewLayout(.fixed(width: 375, height: 60))
          .padding()
          SettingsRowView(name: "Website", linkLabel: "SwfitUI Masteclass", linkDestionation: "swiftuimasterclass.com")
             .preferredColorScheme(.dark)
             .previewLayout(.fixed(width: 375, height: 60))
             .padding()
       }
    }
}
