//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Kirill Sytkov on 10.12.2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
                
            }
            .tint(.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24,weight: .regular))
            }
            .tint(.primary)
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
