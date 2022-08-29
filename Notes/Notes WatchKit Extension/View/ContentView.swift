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
         if notes.count >= 1 {
            List {
               ForEach(0..<notes.count, id: \.self) { i in
                  HStack {
                     Capsule()
                        .frame(width:4)
                        .foregroundColor(.accentColor)
                     Text(notes[i].text)
                        .lineLimit(1)
                        .padding()
                  } //Hstack
               }
               .onDelete(perform: delete)
            }
         } else {
            Spacer()
            Image(systemName: "note.text")
               .resizable()
               .scaledToFit()
               .foregroundColor(.gray)
               .opacity(0.25)
               .padding(25)
            Spacer()
         } //List
      }//VStack
      .navigationTitle("Notes")
      .onAppear {
         load()
      }
   }
   
   //MARK: - Func
   func getDocumentDirectory() -> URL {
      let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      return path[0]
   }
   
   func save() {
      do {
         let data = try JSONEncoder().encode(notes)
         let url = getDocumentDirectory().appendingPathComponent("notes")
         try data.write(to: url)
      } catch {
         debugPrint("Saving data has failed")
      }
   }
   
   func load() {
      DispatchQueue.main.async {
         do {
            let url = getDocumentDirectory().appendingPathComponent("notes")
            let data = try Data(contentsOf: url)
            notes = try JSONDecoder().decode([Note].self, from: data)
         } catch {
            debugPrint("can't load data")
         }
      }
   }
   
   func delete(offsets: IndexSet) {
      withAnimation {
         notes.remove(atOffsets: offsets)
         save()
      }
   }
   
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}