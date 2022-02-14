//
//  NewRecipeView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import SwiftUI

struct NewRecipeView: View {
    @Environment(\.dismiss) private var dismiss
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
                List {
                    ForEach(vm.ingredients) { ingredient in
                        HStack {
                            Text(ingredient.nameStr)
                            Spacer()
                            Text(ingredient.quantityStr)
                                .padding(.horizontal)
                        }
                    }
                    .onDelete(perform: vm.deleteIngredients)
                }
            } header: {
                HStack {
                    Text("Ingredients")
                    Spacer()
                    NavigationLink(destination: AddIngredientView(onAdd: vm.newIngredient)) {
                        Text("Add")
                    }
                    .disabled(vm.saveDisabled)
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
                    .disabled(vm.saveDisabled)
                }
            }
        }
        .navigationTitle("New Recipe")
        .toolbar {
            ToolbarItem {
                Button("Save") {
                    vm.save()
                    dismiss()
                }
                .disabled(vm.saveDisabled)
            }
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
