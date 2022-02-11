//
//  ContentView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Text("KitchenSink")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
