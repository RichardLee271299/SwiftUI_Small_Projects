//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Kirill Sytkov on 29.08.2022.
//

import SwiftUI

struct ContentView: View {
   //MARK: - Properties
   @State private var notes: [Note] = [Note]()
   @State private var text = ""
   
   //MARK: - Body
   var body: some View {
      VStack {
         HStack(alignment: .center, spacing: 6) {
            TextField("Add New Note", text: $text)
            
            Button {
               guard text.isEmpty == false else { return }
               let note = Note(id: UUID(), text: text)
               notes.append(note)
               text = ""
               save()
            } label: {
               Image(systemName: "plus.circle")
                  .font(.system(size: 42, weight: .semibold, design: .rounded))
            }
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.accentColor)
            
         }//HStack
         Spacer()
         Text("\(notes.count)")
      }//VStack
      .navigationTitle("Notes")
   }
   
   //MARK: - Func
   func save() {
      dump(notes)
   }
   
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
