//
//  ContactsList.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import SwiftUI

struct ContactsList: View {
    
    @StateObject private var viewModel: ContactsList.ViewModel
    
    init(viewModel: ContactsList.ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter contact's first name", text: $viewModel.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    viewModel.saveContact()
                    viewModel.getContacts()
                }
            }
            List {
                ForEach(viewModel.contacts) { contact in
                    Text("\(contact.firstName)")
                }
            }
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            viewModel.getContacts()
        })
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList()
    }
}
