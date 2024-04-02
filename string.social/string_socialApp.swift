//
//  string_socialApp.swift
//  string.social
//
//  Created by Saksham Gupta on 4/2/24.
//

import SwiftUI

@main
struct string_socialApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
