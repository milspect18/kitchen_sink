//
//  TimeInterval+Extensions.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/15/22.
//

import Foundation

extension TimeInterval {
    static func FromMinutes(_ minutes: Double) -> TimeInterval {
        return TimeInterval(minutes * 60)
    }
}

