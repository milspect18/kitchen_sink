//
//  AddIngredientView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import SwiftUI

struct AddIngredientView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var quantity: String = ""
    let onAdd: (_ name: String, _ quantity: String) -> Void
    
    var body: some View {
        Form {
            Section("Details:") {
                TextField("Name", text: $name)
                TextField("Quantity", text: $quantity)
            }
        }
        .navigationTitle("Ingredient")
        .toolbar {
            ToolbarItem {
                Button("Add") {
                    onAdd(name, quantity)
                    dismiss()
                }
            }
        }
    }
}

struct AddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        AddIngredientView() { _, _ in }
    }
}
