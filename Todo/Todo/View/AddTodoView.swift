//
//  AddTodoView.swift
//  Todo
//
//  Created by Kirill Sytkov on 29.11.2022.
//

import SwiftUI

struct AddTodoView: View {
    //MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    //MARK: - ToDo name
                    TextField("Todo", text: $name)
                    
                    //MARK: - Todo priority
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    //MARK: - Save button
                    Button {
                        print("Save todo")
                    } label: {
                        Text("Save")
                    }

                }
                Spacer()
            }//: VStack
            .navigationBarTitle("New Todo", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
        } //: NAVIGATION
    }
    
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
