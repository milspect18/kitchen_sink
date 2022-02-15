//
//  CookingStep+CDHelpers.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import Foundation


extension CookingStep {
    var detailsStr: String { self.details ?? "" }
    var timeStr: String {
        let formatter = DateComponentsFormatter()
        
        formatter.unitsStyle = .brief
        formatter.allowedUnits = .minute
        
        return formatter.string(from: self.time) ?? ""
    }
}
