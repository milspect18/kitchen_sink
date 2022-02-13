//
//  Recipe+CDHelpers.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import Foundation
import UIKit

extension Recipe {
    static var example: Recipe {
        let ctx = PersistenceController.preview.container.viewContext
        let recipe = Recipe(context: ctx)
        let imgData = UIImage(named: "grilled_cheese")?.pngData() ?? Data()
        
        recipe.timestamp = Date()
        recipe.name = "Grilled Cheese"
        recipe.recipeId = UUID()
        recipe.details = "A staple childhood favorite!"
        recipe.image = imgData
        recipe.ingredients = NSSet(array: [])
        recipe.meals = NSSet(array: [])
        
        return recipe
    }
}
