//
//  Persistence.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
            return container.viewContext
        }
    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Fish")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }

}

extension PersistenceController {
    
    func getContacts() -> [Contact] {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
}
