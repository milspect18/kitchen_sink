//
//  CookingStep+CDHelpers.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/13/22.
//

import Foundation


extension CookingStep {
    var detailsStr: String { self.details ?? "" }
    var timeStr: String { DateComponentsFormatter().string(from: self.time) ?? "" }
}
