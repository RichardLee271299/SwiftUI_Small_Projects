//
//  ListRowItemView.swift
//  Devote
//
//  Created by Kirill Sytkov on 28.08.2022.
//

import SwiftUI

struct ListRowItemView: View {
   @Environment(\.managedObjectContext) var viewContext
   @ObservedObject var item: Item
   
   var body: some View {
      Toggle(isOn: $item.completion) {
         Text(item.task ?? "")
            .font(.system(.title2, design: .rounded))
            .fontWeight(.heavy)
            .foregroundColor(item.completion ? .pink : .primary)
            .padding(.vertical, 12)
            .animation(.default)
      }// toggle
      .toggleStyle(CheckboxStyle())
      .onReceive(item.objectWillChange) { _ in
         if self.viewContext.hasChanges {
            try? self.viewContext.save()
         }
      }
   }
}
