//
//  Contact+Manager.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import CoreData
import Combine
import os

protocol ContactDataServiceProtocol {
    func getContacts() -> [Contact]
    func getContactById(id: NSManagedObjectID) -> Contact?
    func addContact(name: String)
    func deleteContact(_ contact: Contact)
}

class ContactDataService: ContactDataServiceProtocol {

    var viewContext: NSManagedObjectContext = PersistenceController.shared.viewContext
    
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
    
    func getContactById(id: NSManagedObjectID) -> Contact? {
        do {
            return try viewContext.existingObject(with: id) as? Contact
        } catch {
            return nil
        }
    }
    
    func addContact(name: String) {
        let newContact = Contact(context: viewContext)
        newContact.firstName = name
        saveContext()
    }
    
    func deleteContact(_ contact: Contact) {
        viewContext.delete(contact)
        saveContext()
    }
    
    func saveContext() {
        PersistenceController.shared.save()
    }
}

class MockContactDataService: ContactDataService {
    
    override init() {
        super .init()
        self.viewContext = PersistenceController.preview.viewContext
        print("MOCK INIT")
    }
}
