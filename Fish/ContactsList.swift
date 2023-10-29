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
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter contact's first name", text: $viewModel.firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save") {
                        withAnimation {
                            viewModel.addContact()
                            viewModel.getContacts()
                            viewModel.firstName = ""
                        }
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 6.0)
                            .foregroundStyle(.yellow)
                    )
                }
                .padding()
                List {
                    ForEach(viewModel.contacts) { contact in
                        Text("\(contact.firstName)")
                    }
                    .onDelete(perform: { index in
                        viewModel.deleteContacts(at: index)
                        viewModel.getContacts()
                    })
                }
                .listStyle(PlainListStyle())
                Spacer()
            }
            .onAppear(perform: {
                viewModel.getContacts()
            })
            .background(
            Rectangle()
                .foregroundStyle(Color.yellow.gradient)
                .saturation(0.3)
            )
            .navigationTitle("Old Way")
        }
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: ContactsList.ViewModel = .init(dataService: MockContactDataService())
        return ContactsList(viewModel: viewModel)
    }
}
