//
//  Persistence.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    static let viewContext = PersistenceController.shared.container.viewContext

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Kitchen-Sink")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

extension PersistenceController {
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        let recipe = Recipe(context: viewContext)
        recipe.name = "Glass of water"
        recipe.details = "A test meal"
        recipe.image = nil
        recipe.timestamp = Date()
        recipe.recipeId = UUID()

        let ingredient = Ingredient(context: viewContext)
        ingredient.name = "Water"
        ingredient.quantity = "1/2 cup"
        ingredient.recipe = recipe

        let step = CookingStep(context: viewContext)
        step.recipe = recipe
        step.stepNum = 0
        step.time = Int64(TimeInterval(3600.0))
        step.details = "Pour water into cup"

        let plannedMeal = Meal(context: viewContext)
        plannedMeal.recipe = recipe

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
