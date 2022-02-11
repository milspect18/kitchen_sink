//
//  MealCategory.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import Foundation

enum MealCategory: Int16, Identifiable, CaseIterable {
    case breakfast = 0
    case lunch = 1
    case dinner = 2
    
    var id: Int16 { rawValue }
    
    var name: String {
        switch self {
            case .breakfast: return "Breakfast"
            case .lunch: return "Lunch"
            case .dinner: return "Dinner"
        }
    }
}
