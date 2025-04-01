//
//  HabitsDM.swift
//  Momentum
//
//  Created by Kamol Madaminov on 01/04/25.
//

import Foundation

class HabitsDM: ObservableObject {
    @Published var items = [HabitDM]()
    
    init(){
        if let data = UserDefaults.standard.data(forKey: "habits") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([HabitDM].self, from: data) {
                self.items = decodedData
                return
            }
        }
        items = []
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "habits")
        }
    }
}
