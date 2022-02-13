//
//  RecipeRepository.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import Foundation
import CoreData
import Combine


final class RecipeRepository: NSObject, NSFetchedResultsControllerDelegate {
    var fetchedRecipes = CurrentValueSubject<[Recipe], Never>([])
    
    private let moc: NSManagedObjectContext
    private var controller: NSFetchedResultsController<Recipe>? = nil
    
    init(moc: NSManagedObjectContext = PersistenceController.viewContext) {
        self.moc = moc
        self.moc.undoManager = UndoManager()
        super.init()
    }
    
    func fetchAll(sortedBy: [NSSortDescriptor] = []) throws {
        let req = Recipe.fetchRequest()
        req.sortDescriptors = sortedBy
        
        self.controller = NSFetchedResultsController(
            fetchRequest: req,
            managedObjectContext: self.moc,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        self.controller?.delegate = self
        try self.controller?.performFetch()
        self.fetchedRecipes.send(self.controller?.fetchedObjects ?? [])
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let newRecipes = controller.fetchedObjects as? [Recipe] else { return }
        self.fetchedRecipes.send(newRecipes)
    }
    
    func undo() {
        self.moc.undo()
    }
    
    func redo() {
        self.moc.redo()
    }
    
    func save() throws {
        if self.moc.hasChanges {
            try self.moc.save()
        }
    }
}
