//
//  ContentView.swift
//  Pinch
//
//  Created by Kirill Sytkov on 27.06.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Property
    @State private var isAnimation: Bool = false
    @State private var imageScale: CGFloat = 1
    
    //MARK: - Content
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - Page Image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimation ? 1 : 0)
                    .scaleEffect(imageScale)
                //MARK: - 1. tap gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            withAnimation(.spring()) {
                                imageScale = 1
                            }
                        }
                    }
            } // ZStack
            .navigationTitle("Pinch and Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimation = true
                }
            }
        }//Navigation
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
