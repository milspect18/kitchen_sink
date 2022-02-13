//
//  NewRecipeViewModel.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import Foundation
import CoreData


class NewRecipeViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var details: String = ""
    @Published var imgData: Data? = nil
    @Published var ingredients: [Ingredient] = []
    @Published var instructions: [CookingStep] = []
    @Published var saveError: Error? = nil
    
    private var moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext = PersistenceController.viewContext) {
        self.moc = moc
    }
    
    var saveDisabled: Bool { return name.isEmpty }
    
    func save() {
        do {
            self.createNewRecipe()
            try self.moc.save()
        } catch {
            self.saveError = error
        }
    }
    
    private func createNewRecipe() {
        let recipe = Recipe(context: self.moc)
        
        recipe.name = self.name
        recipe.details = self.details
        recipe.ingredients = NSSet(array: self.ingredients)
        recipe.steps = NSSet(array: self.instructions)
    }
}
