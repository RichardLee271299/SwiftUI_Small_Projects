//
//  RecipeCookingVIew.swift
//  Avocados
//
//  Created by Kirill Sytkov on 06.11.2022.
//

import SwiftUI

struct RecipeCookingVIew: View {
    //MARK: - Prperties
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Service: \(recipe.serves)")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation)")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Cooking: \(recipe.cooking)")
            }
        }
        .font(.footnote)
        .foregroundColor(.gray)
    }
}

struct RecipeCookingVIew_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingVIew(recipe: recipeData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
