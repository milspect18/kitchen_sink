//
//  NewRecipeView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import SwiftUI

struct NewRecipeView: View {
    @StateObject var vm = NewRecipeViewModel()
    
    var body: some View {
        Form {
            Section("Name:") {
                TextField("Recipe name", text: $vm.name)
            }
             
            Section("Description:") {
                TextEditor(text: $vm.details)
                    .frame(minHeight: 100)
            }
            
            Section {
                List(vm.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.nameStr)
                        Spacer()
                        Divider()
                        Spacer()
                        Text(ingredient.quantityStr)
                    }
                }
            } header: {
                HStack {
                    Text("Ingredients")
                    Spacer()
                    NavigationLink(destination: Text("Add ingredient")) {
                        Text("Add")
                    }
                }
            }

            Section {
                List(vm.instructions) { step in
                    VStack {
                        HStack {
                            Text("Step \(step.stepNum)")
                            Spacer()
                            Divider()
                            Spacer()
                            Text(step.timeStr)
                        }
                        
                        Text(step.detailsStr)
                    }
                }
            } header: {
                HStack {
                    Text("Instructions")
                    Spacer()
                    NavigationLink(destination: Text("Add step")) {
                        Text("Add")
                    }
                }
            }
        }
        .navigationTitle("New Recipe")
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
