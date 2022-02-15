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
    @Published var inError: Bool = false
    
    var lastError: Error? = nil
    
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
            self.lastError = error
        }
    }
    
    func newIngredient(_ name: String, _ quantity: String) {
        let ingredient = Ingredient(context: self.moc)
        ingredient.name = name
        ingredient.quantity = quantity
        
        self.ingredients.append(ingredient)
    }
    
    func deleteIngredients(offsets: IndexSet) {
        for idx in offsets.reversed() {
            self.moc.delete(self.ingredients[idx])
            self.ingredients.remove(at: idx)
        }
        
        do {
            try self.moc.save()
        } catch {
            self.lastError = error
        }
    }
    
    func newStep(_ time: Double, _ details: String) {
        let step = CookingStep(context: self.moc)
        step.time = TimeInterval.FromMinutes(time)
        step.details = details
        step.stepNum = Int32(self.instructions.endIndex)
        
        self.instructions.append(step)
    }
    
    func deleteSteps(offsets: IndexSet) {
        for idx in offsets.reversed() {
            self.moc.delete(self.instructions[idx])
            self.instructions.remove(at: idx)
        }
        
        do {
            try self.moc.save()
        } catch {
            self.lastError = error
        }
    }
    
    private func createNewRecipe() {
        let recipe = Recipe(context: self.moc)
        
        recipe.name = self.name
        recipe.details = self.details
        
        self.linkIngredients(to: recipe)
        self.linkSteps(to: recipe)
    }
    
    private func linkIngredients(to recipe: Recipe) {
        for ingredient in self.ingredients {
            ingredient.recipe = recipe
        }
    }
    
    private func linkSteps(to recipe: Recipe) {
        for step in self.instructions {
            step.recipe = recipe
        }
    }
}
