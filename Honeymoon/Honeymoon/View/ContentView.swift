//
//  ContentView.swift
//  Honeymoon
//
//  Created by Kirill Sytkov on 09.12.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State var showAlert = false
    
    //MARK: - Body
    var body: some View {
        VStack {
            HeaderView()
            
            Spacer()
            
            CardView(honeymoon: honeymoonData[0])
                .padding()
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("SUCCESS"), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
