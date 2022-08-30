//
//  HeaderVIew.swift
//  Notes WatchKit Extension
//
//  Created by Kirill Sytkov on 30.08.2022.
//

import SwiftUI

struct HeaderView: View {
   //MARK: - Properties
   var title = ""
   
   //MARK: - Body
    var body: some View {
       VStack {
          // Title
          if title != "" {
             Text(title.uppercased())
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.accentColor) 
          }
          
          //Separator
          HStack {
             Capsule()
                .frame(height:1)
             Image(systemName: "note.text")
             Capsule()
                .frame(height: 1)
          }
          .foregroundColor(.accentColor)
       } // Hstack
    } //Vstack
}

struct HeaderVIew_Previews: PreviewProvider {
    static var previews: some View {
       Group {
          HeaderView(title: "Credits")
          HeaderView()
       }
    }
}
