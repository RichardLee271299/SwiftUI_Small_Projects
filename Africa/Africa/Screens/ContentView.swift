//
//  ContentView.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
   //MARK: - Properties
   
   //MARK: - Body
    var body: some View {
       NavigationView {
          List {
             CoverImageView()
                .frame(height:300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          } // LIST
          .navigationTitle("Africa")
          .navigationBarTitleDisplayMode(.large)
       } //NAVIGATION
    }
}
//MARK: -  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
