//
//  AddInstructionView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import SwiftUI

struct AddInstructionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var details: String = ""
    @State private var time: String = ""
    var onAdd: (_: Double, _: String) -> Void
    
    var timeInterval: Double? { Double(time) }
    
    var body: some View {
        Form {
            HStack {
                Text("Cook Time:")
                Spacer()
                TextField("00", text: $time)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 100)
                    .onChange(of: time) { time = $0.filter{ $0.isNumber } }
                Text("min")
            }
            
            Section("Step Instructions") {
                TextEditor(text: $details)
                    .frame(minHeight: 100)
            }
        }
        .navigationTitle("New Step")
        .toolbar {
            ToolbarItem {
                Button("Add") {
                    if let timeInterval = timeInterval {
                        onAdd(timeInterval, details)
                    }
                    
                    dismiss()
                }
                .disabled(timeInterval == nil || details.isEmpty)
            }
        }
    }
}

struct AddInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        AddInstructionView() { _, _ in }
    }
}
