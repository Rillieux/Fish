//
//  ObservableMacroView.swift
//  Fish
//
//  Created at 17:30 on 29.10.2023.
//
//  Copyright (c) 2023  Dave Kondris. All rights reserved.
//


import SwiftUI

struct ObservableMacroView: View {
    
    @State private var viewModel: ObservableMacroView.ViewModel
    
    init(viewModel: ObservableMacroView.ViewModel = .init()) {
        _viewModel = State(wrappedValue: viewModel)
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
                            .foregroundStyle(.mint)
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
                .foregroundStyle(Color.mint.gradient)
                .saturation(0.3)
            )
            .navigationTitle("Observable Way")
        }
    }
}

#Preview {
    let viewModel: ObservableMacroView.ViewModel = .init(dataService: MockContactDataService())
    return ObservableMacroView(viewModel: viewModel)
}
