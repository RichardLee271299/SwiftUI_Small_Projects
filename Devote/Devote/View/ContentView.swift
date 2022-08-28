//
//  ContentView.swift
//  Devote
//
//  Created by Kirill Sytkov on 27.08.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
   //MARK: - Properties
   @State var task: String = ""
   
   private var isButtonDisabled: Bool {
      task.isEmpty
   }
   
   //Fetching data
   @Environment(\.managedObjectContext) private var viewContext
   
   @FetchRequest(
      sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
      animation: .default)
   private var items: FetchedResults<Item>
   
   //MARK: - Body
   var body: some View {
      NavigationView {
         ZStack {
            VStack {
               VStack(spacing: 16) {
                  TextField("New Task", text: $task)
                     .padding()
                     .background(
                        Color(UIColor.systemGray6)
                     )
                     .cornerRadius(10)
                  Button {
                     addItem()
                  } label: {
                     Spacer()
                     Text("Save")
                     Spacer()
                  }
                  .disabled(isButtonDisabled)
                  .padding()
                  .font(.headline)
                  .foregroundColor(.white)
                  .background(isButtonDisabled ? Color.gray : Color.pink)
                  .cornerRadius(10)
               }//VSTACK
               .padding()
               
               List {
                  ForEach(items) { item in
                     NavigationLink {
                        Text(item.task ?? "")
                           .font(.headline)
                           .fontWeight(.bold)
                        Text(item.timestamp!, formatter: itemFormatter)
                           .font(.footnote)
                           .foregroundColor(.gray)
                     } label: {
                        VStack(alignment: .leading) {
                           Text(item.task ?? "")
                              .font(.headline)
                              .fontWeight(.bold)
                           Text(item.timestamp!, formatter: itemFormatter)
                              .font(.footnote)
                              .foregroundColor(.gray)
                        }
                     }
                  }
                  .onDelete(perform: deleteItems)
               } //List
               .listStyle(InsetGroupedListStyle())
               .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
               .padding(.vertical, 0)
               .frame(maxWidth: 640)
            } // VStack
         }//ZStack
         .onAppear() {
            UITableView.appearance().backgroundColor = UIColor.clear
         }
         .navigationTitle("Daily Tasks")
         .navigationBarTitleDisplayMode(.large)
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               EditButton()
            }
         }// Toolbar
         .background(
            BackgroundImageView()
         )
         .background(
            backgroundGradient.ignoresSafeArea(.all)
         )
      }// Navigation
      .navigationViewStyle(StackNavigationViewStyle())
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
      }
   }
   
   private func deleteItems(offsets: IndexSet) {
      withAnimation {
         offsets.map { items[$0] }.forEach(viewContext.delete)
         
         do {
            try viewContext.save()
         } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
      }
   }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
   }
}
