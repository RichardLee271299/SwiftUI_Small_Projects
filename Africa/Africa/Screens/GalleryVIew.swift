//
//  GalleryVIew.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI

struct GalleryVIew: View {
    var body: some View {
       ScrollView(.vertical, showsIndicators: false) {
          Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
       }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(MotionAnimationView())
    }
}

struct GalleryVIew_Previews: PreviewProvider {
    static var previews: some View {
        GalleryVIew()
    }
}
