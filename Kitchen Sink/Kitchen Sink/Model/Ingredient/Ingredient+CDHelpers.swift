//
//  Ingredient+CDHelpers.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import Foundation


extension Ingredient {
    var nameStr: String { self.name ?? "" }
    var quantityStr: String { self.quantity ?? "" }
}
