//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Kirill Sytkov on 28.08.2022.
//

import SwiftUI

struct NewTaskItemView: View {
   //MARK: - Properties
   @Environment(\.managedObjectContext) private var viewContext
   @State private var task = ""
   @Binding var isShowing: Bool
   @AppStorage("isDarkMode") private var isDarkMode = false
   private var isButtonDisabled: Bool {
      task.isEmpty
   }
   
   //MARK: - Body
   var body: some View {
      VStack {
         Spacer()
         VStack(spacing: 16) {
            TextField("New Task", text: $task)
               .foregroundColor(.pink)
               .font(.system(size: 24, weight: .bold, design: .rounded))
               .padding()
               .background(
                  isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
               )
               .cornerRadius(10)
            Button {
               addItem()
               playSound(sound: "sound-ding", type: "mp3")
               feedback.notificationOccurred(.success )
            } label: {
               Spacer()
               Text("Save")
                  .font(.system(size: 24, weight: .bold, design: .rounded))
               Spacer()
            }
            .disabled(isButtonDisabled)
            .padding()
            .foregroundColor(.white)
            .background(isButtonDisabled ? Color.blue : Color.pink)
            .cornerRadius(10)
            .onTapGesture {
               if isButtonDisabled {
                  playSound(sound: "sound-tap", type: "mp3")
               }
            }
         }//VSTACK
         .padding(.horizontal)
         .padding(.vertical, 20)
         .background( isDarkMode ?  Color(UIColor.secondarySystemBackground) : Color.white)
         .cornerRadius(16)
         .shadow(color: Color( red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
         .frame(maxWidth: 640)
      } //VSTACK
      .padding()
   }
   
   //MARK: - Func
   
   private func addItem() {
      withAnimation {
         let newItem = Item(context: viewContext)
         newItem.timestamp = Date()
         newItem.task = task
         newItem.completion = false
         newItem.id = UUID()
         do {
            try viewContext.save()
         } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
         task = ""
         hideKeyboard()
         isShowing = false
      }
   }
}
