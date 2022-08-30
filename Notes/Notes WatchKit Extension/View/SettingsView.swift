//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Kirill Sytkov on 30.08.2022.
//

import SwiftUI

struct SettingsView: View {
   //MARK: - Properties
   @AppStorage("lineCount") var lineCount: Int = 1
   
   //MARK: - Body
    var body: some View {
       VStack(spacing: 8) {
          HeaderView(title: "Settings")
          
          Text("Lines: \(lineCount)".uppercased())
             .fontWeight(.bold)
          
          Slider(value: Binding(get: {
             Float(self.lineCount)
          }, set: { newValue in
             self.lineCount = Int(newValue)
          }), in: 1...4, step: 1)
             .tint(.accentColor)
       }
    }
   
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
