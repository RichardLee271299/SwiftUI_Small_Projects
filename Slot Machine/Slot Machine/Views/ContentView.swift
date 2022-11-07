//
//  ContentView.swift
//  Slot Machine
//
//  Created by Kirill Sytkov on 07.11.2022.
//

import SwiftUI


struct ContentView: View {
    
    
    
    var body: some View {
        ZStack {
            //MARK: - Background
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            //MARK: - Interface
            VStack(alignment: .center, spacing: 5) {
                //MARK: - Header
                LogoVIew()
                
                Spacer()
                //MARK: - Score
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreConteinerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                        
                    }
                    .modifier(ScoreConteinerModifier())
                    
                }
                
                //MARK: - Slot Machine
                
                //MARK: - Footer
                Spacer()
            }
            //MARK: - Buttons
            .overlay(
                //reset
                Button(action: {
                    print("reset")
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifier()), alignment: .topLeading
                
            )
            .overlay(
                // info
                Button(action: {
                    print("Info view")
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifier()), alignment: .topTrailing
                
            )
            .padding()
            .frame(maxWidth: 720)
            
            //MARK: - Popup
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
