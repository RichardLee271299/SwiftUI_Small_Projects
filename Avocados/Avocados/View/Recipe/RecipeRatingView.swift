//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Kirill Sytkov on 06.11.2022.
//

import SwiftUI

struct RecipeRatingView: View {
    //MARK: - Properties
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(0 ..< recipe.rating) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(recipe: recipeData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
