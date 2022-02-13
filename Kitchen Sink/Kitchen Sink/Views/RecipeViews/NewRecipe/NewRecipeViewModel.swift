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
    
    func save() {
        do {
            try self.moc.save()
        } catch {
            self.saveError = error
        }
    }
}
