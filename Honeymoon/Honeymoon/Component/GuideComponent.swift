//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Kirill Sytkov on 10.12.2022.
//

import SwiftUI

struct GuideComponent: View {
    //MARK: - Properties
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .fontWeight(.heavy)
                    
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                Divider()
                    .padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "title", subtitle: "subtitle", description: "this is a placeholder sentence", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
