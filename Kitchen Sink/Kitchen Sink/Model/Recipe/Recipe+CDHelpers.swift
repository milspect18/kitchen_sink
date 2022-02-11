//
//  Recipe+CDHelpers.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import Foundation

extension Recipe {
    static var example: Recipe {
        let ctx = PersistenceController(inMemory: true).container.viewContext
        let recipe = Recipe(context: ctx)
        
        recipe.timestamp = Date()
        recipe.name = "Grilled Cheese"
        recipe.id = UUID()
        recipe.details = "A staple childhood favorite!"
        recipe.ingredients = NSSet(array: [])
        recipe.meals = NSSet(array: [])
        
        return recipe
    }
}
