//
//  ContentView.swift
//  Momentum
//
//  Created by Kamol Madaminov on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = HabitsDM()
    @State private var showAddHabitView = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(habits.items){ habit in
                    NavigationLink(destination: HabitDetailView(habits: habits, habit: habit)){
                        VStack(alignment: .leading){
                            Text(habit.title)
                                .font(.headline)
                            Text(habit.description ?? "")
                        }
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button(){
                    showAddHabitView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddHabitView) {
                AddHabitView(habits: habits)
            }
        }
    }
}

#Preview {
    ContentView()
}
