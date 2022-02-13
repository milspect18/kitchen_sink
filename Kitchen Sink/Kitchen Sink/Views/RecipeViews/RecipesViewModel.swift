//
//  RecipesViewModel.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import Foundation
import CoreData


class RecipesViewModel: NSObject, ObservableObject {
    @Published var recipes: [Recipe] = []
    
    private let moc: NSManagedObjectContext
    
    init(moc: NSManagedObjectContext = PersistenceController.viewContext) {
        self.moc = moc
        super.init()
        
        self.fetchRecipes()
    }
    
    private func fetchRecipes() {
        let req = Recipe.fetchRequest()
        req.sortDescriptors = []
        
        let fetchCtlr = NSFetchedResultsController<Recipe>(
            fetchRequest: req,
            managedObjectContext: self.moc,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchCtlr.delegate = self
        
        do {
            try fetchCtlr.performFetch()
            guard let newRecipes = fetchCtlr.fetchedObjects else { return }
            self.recipes = newRecipes
        } catch {
            print("Failed to fetch recipes: \(error.localizedDescription)")
        }
    }
}

extension RecipesViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let newRecipes = controller.fetchedObjects as? [Recipe] else { return }
        self.recipes = newRecipes
    }
}
