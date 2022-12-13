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
    @State var showGuideView = false
    @State var showInfoView = false
    
    var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2  {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    //MARK: - Body
    var body: some View {
        VStack {
            //MARK: - Header
            HeaderView(showGuideView: $showGuideView,showInfoView: $showInfoView)
            
            Spacer()
            //MARK: - Cards
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            //MARK: - Footer
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("SUCCESS"), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
    
    
    //MARK: - funcs
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
