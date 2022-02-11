//
//  RecipeListItemView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import SwiftUI

struct RecipeListItemView: View {
    let recipe: Recipe
    
    var body: some View {
        NavigationLink(destination: Text(recipe.details ?? "")) {
            HStack {
                RecipeThumbnailView(recipe.image ?? Data(), diameter: 60)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(recipe.name ?? "")
                        .font(.title2)
                    
                    Text(recipe.details ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.leading)
            }
        }
    }
}

struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListItemView(recipe: Recipe.example)
    }
}
