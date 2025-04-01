//
//  HabitDetailView.swift
//  Momentum
//
//  Created by Kamol Madaminov on 01/04/25.
//

import SwiftUI

struct HabitDetailView: View {
    @ObservedObject var habits: HabitsDM
    let habit: HabitDM
    var habitIndex: Int{
        habits.items.firstIndex(where: { $0.id == habit.id} )!
    }
    
    var body: some View {
        VStack{
            Text(habit.title)
                .font(.largeTitle)
            Text(habit.description ?? "")
                .padding()
            Text("Completion count: \(habits.items[habitIndex].count)")
                .padding()
            Button("Increment"){
                habits.items[habitIndex].count += 1
            }
                .padding()
        }
        .navigationTitle(habit.title)
    }
}

#Preview {
    HabitDetailView(habits: HabitsDM(), habit: HabitDM(title: "Hi"))
}
