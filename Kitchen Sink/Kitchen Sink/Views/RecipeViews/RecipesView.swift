//
//  RecipesView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import SwiftUI

struct RecipesView: View {
    @StateObject var vm = RecipesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeListItemView(recipe: recipe)
                            .padding(.vertical)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipesView(vm: RecipesViewModel(moc: PersistenceController.preview.container.viewContext))
            
            RecipesView(vm: RecipesViewModel(moc: PersistenceController.preview.container.viewContext))
                .preferredColorScheme(.dark)
        }
    }
}
