//
//  DevoteApp.swift
//  Devote
//
//  Created by Kirill Sytkov on 27.08.2022.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
   
   @AppStorage("isDarkMode") var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
