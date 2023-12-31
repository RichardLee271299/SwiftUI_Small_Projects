//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Kirill Sytkov on 30.08.2022.
//

import SwiftUI

struct DetailView: View {
   //MARK: - Properties
   let note: Note
   let count: Int
   let index: Int
   
   @State private var isCreditsPresented = false
   @State private var isSettingsPresented = false
   //MARK: - Body
    var body: some View {
       
       VStack(alignment: .center, spacing: 3) {
          HeaderView(title: "")

          Spacer()
          ScrollView(.vertical) {
             Text(note.text)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
          }
          Spacer()

          HStack(alignment: .center) {
             Image(systemName: "gear")
                .imageScale(.large)
                .onTapGesture {
                   isSettingsPresented.toggle()
                }
                .sheet(isPresented: $isSettingsPresented) {
                   SettingsView()
                }
             
             Spacer()
             
             Text("\(count) / \(index + 1)")
             
             Spacer()
             
             Image(systemName: "info.circle")
                .imageScale(.large)
                .onTapGesture {
                   isCreditsPresented.toggle()
                }
                .sheet(isPresented: $isCreditsPresented) {
                   CreditsView()
                }
          }//hstack
          .foregroundColor(.secondary)
          
       }//Vstack
       .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
   static var sampleData = Note(id: UUID(), text: "Hello")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
