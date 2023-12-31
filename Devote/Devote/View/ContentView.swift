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
   @AppStorage("isDarkMode") private var isDarkMode = false
   @State var task: String = ""
   @State private var showNewTaskItem = false
   
   
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
            //MARK: - Main view
            VStack {
               //MARK: - Header
               HStack(spacing: 10) {
                  //title
                  Text("Devote")
                     .font(.system(.largeTitle, design: .rounded))
                     .fontWeight(.heavy)
                     .padding(.leading, 4)
                  Spacer()
                  
                  //edit button
                  EditButton()
                     .font(.system(size: 16, weight: .semibold, design: .rounded))
                     .padding(.horizontal, 10)
                     .frame(minWidth: 70, minHeight: 24)
                     .background(Capsule().stroke(Color.white, lineWidth: 2))
                  
                  //apperience button
                  Button {
                     isDarkMode.toggle()
                     playSound(sound: "sound-tap", type: "mp3")
                     feedback.notificationOccurred(.success )
                  } label: {
                     Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .font(.system(.title, design: .rounded))
                  }
                  
                  
               }// hstack
               .padding()
               .foregroundColor(.white)
               Spacer(minLength: 80)
               
               //MARK: - New Task Button
               Button {
                  showNewTaskItem = true
                  playSound(sound: "sound-ding", type: "mp3")
                  feedback.notificationOccurred(.success )
               } label: {
                  Image(systemName: "plus.circle")
                     .font(.system(size: 30, weight: .semibold, design: .rounded))
                  Text("New Task")
                     .font(.system(size: 24, weight: .bold, design: .rounded))
               }
               .foregroundColor(.white)
               .padding(.horizontal, 20)
               .padding(.vertical, 15)
               .background(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .leading, endPoint: .trailing)
                  .clipShape(Capsule()))
               .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
               
               //MARK: - Tasks
               List {
                  ForEach(items) { item in
                     ListRowItemView(item: item)
                  }
                  .onDelete(perform: deleteItems)
               } //List
               .listStyle(InsetGroupedListStyle())
               .shadow(color: .black.opacity(0.3), radius: 12)
               .padding(.vertical, 0)
               .frame(maxWidth: 640)
            } // VStack
            .blur(radius: showNewTaskItem ? 8 : 0, opaque: false)
            .animation(.easeOut(duration: 0.5 ))
            .transition(.move(edge: .bottom))
            
            
            //MARK: - New task Item
            if showNewTaskItem {
               BlankView(backgroundColor: isDarkMode ? .black : .gray, backgroundOpacity:isDarkMode ? 0.3 : 0.5)
                  .onTapGesture {
                     withAnimation {
                        showNewTaskItem = false
                     }
                  }
               NewTaskItemView(isShowing: $showNewTaskItem)
            }
            
         }//ZStack
         .onAppear() {
            UITableView.appearance().backgroundColor = UIColor.clear
         }
         .navigationTitle("Daily Tasks")
         .navigationBarTitleDisplayMode(.large)
         .navigationBarHidden(true)
         .background(
            BackgroundImageView()
               .blur(radius: showNewTaskItem ? 8 : 0, opaque: false)
         )
         .background(
            backgroundGradient.ignoresSafeArea(.all)
         )
      }// Navigation
      .navigationViewStyle(StackNavigationViewStyle())
   }
   
   //MARK: - Func
   
   
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
