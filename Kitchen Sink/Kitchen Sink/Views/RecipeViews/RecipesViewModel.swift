//
//  RecipesViewModel.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import Foundation
import CoreData
import Combine


class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    private let repo: RecipeRepository
    
    init(moc: NSManagedObjectContext = PersistenceController.viewContext) {
        self.repo = RecipeRepository(moc: moc)
        
        self.repo.fetchedRecipes
            .receive(on: DispatchQueue.main)
            .assign(to: &self.$recipes)
        
        try? self.repo.fetchAll()
    }
}
