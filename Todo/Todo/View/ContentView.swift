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
    
    @FetchRequest(entity: TodoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TodoItem.name, ascending: true)]) var todos: FetchedResults<TodoItem>
    
    @State private var showingAddTodoView = false
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(self.todos, id: \.self) { todo in
                    HStack {
                        Text(todo.name ?? "Unknown")
                        
                        Spacer()
                        
                        Text(todo.priority ?? "Unknown")
                    }
                }//: FOREACH
                .onDelete(perform: deleteTodo(at:))
            } //: LIST
            .navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }//: ADD BUTTON
                    .sheet(isPresented: $showingAddTodoView) {
                        AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
