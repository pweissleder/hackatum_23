//
//  Preferences.swift
//  TailoredTaste
//
//  Created by Marc Beil on 17.11.23.
//

import Foundation

struct Preferences: Codable {
    var isCheatDay: Bool
    var vegetarian: Bool
    var vegan: Bool
    var glutenFree: Bool
    var dairyFree: Bool
    var veryHealthy: Bool
    var cheap: Bool
    var veryPopular: Bool
    var sustainable: Bool
    var cuisines: [String]
    var diets: [String]
}
