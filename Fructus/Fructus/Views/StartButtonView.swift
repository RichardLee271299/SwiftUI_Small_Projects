//
//  StartButtonView.swift
//  Fructus
//
//  Created by Kirill Sytkov on 29.06.2022.
//

import SwiftUI

struct StartButtonView: View {
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Capsule().strokeBorder(.white, lineWidth: 1.25))
        }
        .accentColor(.white)
    }
    
}
//MARK: - Preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
