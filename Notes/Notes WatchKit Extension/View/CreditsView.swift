//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Kirill Sytkov on 30.08.2022.
//

import SwiftUI

struct CreditsView: View {
   //MARK: - Properties
   
   
   //MARK: - Body
   var body: some View {
      VStack(spacing: 3) {
         // profile image
         Image("developer-no1")
            .resizable()
            .scaledToFit()
            .layoutPriority(1)
         //header
         HeaderView(title: "Credits")
         //content
         Text("Kirill Sytkov")
            .foregroundColor(.primary)
            .fontWeight(.bold)
         Text("Developer")
            .font(.footnote)
            .foregroundColor(.secondary)
            .fontWeight(.light)
      }// Vstack
   }
}

struct CreditsView_Previews: PreviewProvider {
   static var previews: some View {
      CreditsView()
   }
}
