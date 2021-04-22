//
//  ContactsList+Extension.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import SwiftUI
import CoreData
import os

extension ContactsList {
    
    class ViewModel: ObservableObject {
        
        var firstName: String = ""
        @Published var contacts: [Contact] = []
        
        func getContacts() {
            contacts = PersistenceController.shared.getContacts()
        }
        
        func saveContact() {
            let contact = Contact(context: PersistenceController.shared.viewContext)
            contact.firstName_ = firstName
            PersistenceController.shared.save()
        }
        
        
    }
    
    
}
