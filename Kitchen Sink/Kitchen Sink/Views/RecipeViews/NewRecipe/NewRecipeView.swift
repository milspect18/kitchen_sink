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
                List {
                    ForEach(vm.instructions) { step in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Step \(step.stepNum + 1)")
                                Divider()
                                    .padding(.horizontal, 16)
                                Text(step.timeStr)
                            }
                            .padding(.top, 6)
                            
                            Divider()
                            
                            Text(step.detailsStr)
                                .padding(.vertical, 8)
                        }
                        .padding(.vertical, 16)
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            GeometryReader { geo in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.systemGroupedBckgnd)
                                    
                                    Rectangle()
                                        .foregroundColor(.secondarySystemGroupedBckgnd)
                                        .frame(width: geo.size.width, height: geo.size.height - 16)
                                        .cornerRadius(12)
                                }
                            }
                        )
                    }
                    .onDelete(perform: vm.deleteSteps)
                }
            } header: {
                HStack {
                    Text("Instructions")
                    Spacer()
                    NavigationLink(destination: AddInstructionView(onAdd: vm.newStep)) {
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
