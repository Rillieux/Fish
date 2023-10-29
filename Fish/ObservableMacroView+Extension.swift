//
//  ObservableMacroView+Extension.swift
//  Fish
//
//  Created at 17:31 on 29.10.2023.
//
//  Copyright (c) 2023  Dave Kondris. All rights reserved.
//


import SwiftUI

extension ObservableMacroView {
    
    @Observable class ViewModel: ObservableObject {
        
        let dataService: ContactDataServiceProtocol
        
        var firstName: String = ""
        
        var contacts: [Contact] = []
        
        init(dataService: ContactDataServiceProtocol = ContactDataService()) {
            self.dataService = dataService
        }
        
        func getContacts() {
            self.contacts = dataService.getContacts()
        }
        
        func addContact(){
            dataService.addContact(name: firstName)
        }
        
        func deleteContacts(at offsets: IndexSet) {
            offsets.forEach { index in
                let contact = contacts[index]
                dataService.deleteContact(contact)
            }
        }
    }
}

