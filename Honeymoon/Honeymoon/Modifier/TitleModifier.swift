//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Kirill Sytkov on 11.12.2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}

