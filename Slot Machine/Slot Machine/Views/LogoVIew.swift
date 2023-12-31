//
//  LogoVIew.swift
//  Slot Machine
//
//  Created by Kirill Sytkov on 07.11.2022.
//

import SwiftUI

struct LogoVIew: View {
    var body: some View {
        Image("gfx-slot-machine")
        .resizable()
        .scaledToFit()
        .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
        .padding(.horizontal)
        .layoutPriority(1)
        .modifier(ShadowModifier())
    }
}

struct LogoVIew_Previews: PreviewProvider {
    static var previews: some View {
        LogoVIew()
    }
}
