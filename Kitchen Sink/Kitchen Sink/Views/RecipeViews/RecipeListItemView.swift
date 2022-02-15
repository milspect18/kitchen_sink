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
        HStack {
            RecipeThumbnailView(recipe.image ?? Data(), diameter: 60)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.name ?? "None")
                    .font(.title2)
                
                Text(recipe.details ?? "None")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
        }
    }
}

struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Grilled Cheese")) {
                    RecipeListItemView(recipe: Recipe.example())
                }
            }
        }
    }
}
