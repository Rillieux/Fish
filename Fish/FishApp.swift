//
//  FishApp.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import SwiftUI

@main
struct FishApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
