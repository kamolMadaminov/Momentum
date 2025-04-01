//
//  HabitDM.swift
//  Momentum
//
//  Created by Kamol Madaminov on 01/04/25.
//

import Foundation

struct HabitDM: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String?
    var count = 0
}
