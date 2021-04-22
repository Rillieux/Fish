//
//  Contact+Manager.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import CoreData

protocol ContactDataServiceProtocol {
    func getContacts() -> [Contact]
    func addContact(name: String)
}

class ContactDataService: ContactDataServiceProtocol {
  
    let viewContext: NSManagedObjectContext = PersistenceController.shared.viewContext

    func getContacts() -> [Contact] {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        let sort: NSSortDescriptor = NSSortDescriptor(keyPath: \Contact.firstName_, ascending: true)
        request.sortDescriptors = [sort]
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func addContact(name: String) {
        let newContact = Contact(context: viewContext)
        newContact.firstName = name
        PersistenceController.shared.save()
    }
}
