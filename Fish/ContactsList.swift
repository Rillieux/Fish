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
                TextField("Enter YOUR contact's first name", text: $viewModel.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    withAnimation {
                        viewModel.addContact()
                        viewModel.getContacts()
                        viewModel.firstName = ""
                    }
                }
            }
            List {
                ForEach(viewModel.contacts) { contact in
                    Text("\(contact.firstName)")
                }
                .onDelete(perform: { index in
                    viewModel.deleteContacts(at: index)
                    viewModel.getContacts()
                })
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
        let viewModel: ContactsList.ViewModel = .init(dataService: MockContactDataService())
        return ContactsList(viewModel: viewModel)
    }
}
