//
//  ContentView.swift
//  Honeymoon
//
//  Created by Kirill Sytkov on 09.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(honeymoon: honeymoonData[1])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
