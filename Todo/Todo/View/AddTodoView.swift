//
//  AddTodoView.swift
//  Todo
//
//  Created by Kirill Sytkov on 29.11.2022.
//

import SwiftUI

struct AddTodoView: View {
    //MARK: - Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dissmiss
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle:String = ""
    @State private var errorMessage: String = ""
    
    //MARK: - Theme
    @ObservedObject var theme = ThemeSettings.shared
    var themes:[Theme] = themeData
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    //MARK: - ToDo name
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size:24, weight: .bold, design: .default))
                        
                    //MARK: - Todo priority
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    //MARK: - Save button
                    Button {
                        if self.name != "" {
                            let todo = TodoItem(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do {
                                try self.managedObjectContext.save()
                               
                            } catch {
                                print(error)
                            }
                        } else {
                            self.errorShowing = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to enter something for\nthe new todo item"
                            return
                        }
                        self.dissmiss()
                    } label: {
                        Text("Save")
                            .font(.system(size:24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[self.theme.themeSettings].themeColor)
                            .cornerRadius(9)
                            .foregroundColor(.white)
                    }//:SAVE BUTTON
                }//:VSTACK
                .padding(.horizontal)
                .padding(.vertical, 30)
                
                Spacer()
            }//: VStack
            .navigationBarTitle("New Todo", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.dissmiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } //: NAVIGATION
        .tint(themes[self.theme.themeSettings].themeColor)
    }
    
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
