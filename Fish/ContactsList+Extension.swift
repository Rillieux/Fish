//
//  ContactsList+Extension.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import SwiftUI
import CoreData
import Combine
import os

extension ContactsList {
    
    class ViewModel: ObservableObject {
        
        let dataService: ContactDataServiceProtocol
        
        var firstName: String = ""
        
        @Published var contacts: [Contact] = []
        
        init(dataService: ContactDataServiceProtocol = ContactDataService()) {
            self.dataService = dataService
        }
        
        func getContacts() {
            self.contacts = dataService.getContacts()
        }
        
        func addContact(){
            dataService.addContact(name: firstName)
        }
    }
}
