//
//  ControllImageView.swift
//  Pinch
//
//  Created by Kirill Sytkov on 28.06.2022.
//

import SwiftUI

struct ControllImageView: View {
    
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControllImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControllImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
