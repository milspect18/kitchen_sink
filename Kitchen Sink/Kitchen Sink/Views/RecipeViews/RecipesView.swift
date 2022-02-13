//
//  RecipesView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import SwiftUI

struct RecipesView: View {
    private let recipe = Recipe(context: PersistenceController.viewContext)
    
    var body: some View {
        List {
            RecipeListItemView(recipe: Recipe.example)
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
