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

         Image("developer-no1")
            .resizable()
            .scaledToFit()
            .layoutPriority(1)

         HeaderView(title: "Credits")

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
