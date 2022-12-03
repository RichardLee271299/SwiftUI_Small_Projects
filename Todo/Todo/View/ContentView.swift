//
//  ContentView.swift
//  Todo
//
//  Created by Kirill Sytkov on 29.11.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @EnvironmentObject var iconSettings: IconNames
    
    @FetchRequest(entity: TodoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TodoItem.name, ascending: true)]) var todos: FetchedResults<TodoItem>
    
    @State private var showingSettingsView = false
    @State private var showingAddTodoView = false
    @State private var animatingButton = false
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes:[Theme] = themeData
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(self.todos, id: \.self) { todo in
                        HStack {
                            Circle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(self.colorize(priority: todo.priority ?? " Normal"))
                            
                            Text(todo.name ?? "Unknown")
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                                .font(.footnote)
                                .foregroundColor(Color(.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay {
                                    Capsule().stroke(Color(.systemGray2), lineWidth: 0.75)
                                }
                        }//:HSTACK
                        .padding(.vertical, 10)
                    }//: FOREACH
                    .onDelete(perform: deleteTodo(at:))
                } //: LIST
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.showingSettingsView.toggle()
                        } label: {
                            Image(systemName: "paintbrush")
                                .imageScale(.large)
                                .tint(themes[self.theme.themeSettings].themeColor)
                        }//: ADD BUTTON
                        .sheet(isPresented: $showingSettingsView) {
                            SettingsView().environmentObject(self.iconSettings )
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                            .tint(themes[self.theme.themeSettings].themeColor)
                    }
            }
                //MARK: - NO Todo items
                if todos.count == 0 {
                    EmptyListView()
                }
            }//:ZSTACK
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
            }
            .overlay(alignment: .bottomTrailing) {
                ZStack {
                    Group {
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(self.animatingButton ? 0.2 : 0)
                            .scaleEffect(self.animatingButton ? 1: 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(self.animatingButton ? 0.15 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true))

                    Button {
                        self.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48,height: 48,alignment: .center)
                    }//BUTTON
                    .tint(themes[self.theme.themeSettings].themeColor)
                    .onAppear {
                        self.animatingButton = true
                    }
                    
                }//ZSATCK
                .padding(.bottom, 15)
                .padding(.trailing, 15)
            }
        }//:NAVIGATION
    }
    
    //MARK: - Funcs
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    private func colorize(priority: String) -> Color {
        switch priority {
        case "High":
            return .pink
        case "Normal":
            return.green
        case "Low":
            return .blue
        default:
            return .gray
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
