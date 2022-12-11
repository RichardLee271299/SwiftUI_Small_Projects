//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Kirill Sytkov on 10.12.2022.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - Properties
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    //MARK: - Body
    var body: some View {
        HStack {
            Button {
                self.showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                self.showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24,weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide = false
    @State static var showInfoView = false
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfoView)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
