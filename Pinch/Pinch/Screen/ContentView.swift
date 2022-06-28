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
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    
    //MARK: - Func
    private func resetImageState() {
        withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    //MARK: - Content
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
                //MARK: - Page Image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimation ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                
                //MARK: - 1. tap gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                
                //MARK: - 2. drag gesture
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.spring()) {
                                    imageOffset = value.translation
                                }
                            })
                            .onEnded({ value in
                                if imageScale <= 1{
                                    resetImageState()
                                }
                            })
                    )
                //MARK: - 3. Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.spring()) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(.spring()) {
                                    if imageScale > 5 {
                                        imageScale = 5
                                    } else if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            })
                    )
            } // ZStack
            .navigationTitle("Pinch and Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimation = true
                }
            }
            
            //MARK: - Info Panel
            .overlay(alignment: .top) {
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                
            }
            
            //MARK: - Controlls
            .overlay(alignment: .bottom) {
                Group {
                    HStack {
                        //Scale down
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                }
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        } label: {
                            ControllImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // Reset
                        Button {
                            withAnimation(.spring()){
                                if imageScale != 1 {
                                    resetImageState()
                                }
                            }
                        } label: {
                            ControllImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // Scale up
                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                }
                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        } label: {
                            ControllImageView(icon: "plus.magnifyingglass")
                        }
                        
                    } // Controls
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimation ? 1 : 0)
                }
                .padding(.bottom, 30)
            }
            //MARK: - Drawer
            .overlay(alignment: .topTrailing) {
                HStack(spacing: 12) {
                    //MARK: - Drawer handle
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        }
                    //MARK: - Thumbnails
                    Spacer()
                }
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .opacity(isAnimation ? 1 : 0)
                .frame(width: 260)
                .padding(.top, UIScreen.main.bounds.height / 12)
                .offset(x: isDrawerOpen ? 20 : 215)
            } // Drawer
  
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
