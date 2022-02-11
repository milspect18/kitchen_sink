//
//  Kitchen_SinkApp.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import SwiftUI

@main
struct Kitchen_SinkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
