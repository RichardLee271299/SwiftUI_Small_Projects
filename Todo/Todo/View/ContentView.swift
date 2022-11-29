//
//  ContentView.swift
//  Todo
//
//  Created by Kirill Sytkov on 29.11.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var showingAddTodoView = false
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List(0..<5) { item in
                Text("hi")
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
                        AddTodoView()
                    }
                }
            }
        }//:NAVIGATION
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
