//
//  CoreData.swift
//  PillUp
//
//  Created by Diogo on 17/08/2025.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "PillUpDataModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Core Data loading error: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Context save error: \(error)")
            }
        }
    }
}
