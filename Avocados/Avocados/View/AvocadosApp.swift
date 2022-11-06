//
//  AvocadosApp.swift
//  Avocados
//
//  Created by Kirill Sytkov on 31.08.2022.
//

import SwiftUI

@main
struct AvocadosApp: App {
   var body: some Scene {
      WindowGroup {
         //            ContentView()
         TabView {
            AvocadosView()
               .tabItem {
                  Image("tabicon-branch")
                  Text("Avocados")
               }
            ContentView()
               .tabItem{
                  Image("tabicon-book")
                  Text("Recipes")
               }
            RipeningStagesView()
               .tabItem {
                  Image("tabicon-avocado")
                  Text("Ripening")
               }
            SettingsView()
               .tabItem {
                  Image("tabicon-settings")
                  Text("Settings")
               }
         }
//         .edgesIgnoringSafeArea(.top)
         .accentColor(Color.primary)
      }
   }
}
