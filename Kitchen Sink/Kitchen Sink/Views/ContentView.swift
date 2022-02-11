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
        TabView {
            RecipesView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Recipes")
                }
            
            MealPlanningView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Meal Planning")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
