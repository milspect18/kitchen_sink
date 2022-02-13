//
//  RecipeDetailView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        Text(recipe.nameStr)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.example())
    }
}
