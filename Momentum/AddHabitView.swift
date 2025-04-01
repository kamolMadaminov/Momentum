//
//  AddHabitView.swift
//  Momentum
//
//  Created by Kamol Madaminov on 01/04/25.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: HabitsDM
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                Button("Save"){
                    let habit = HabitDM(title: title, description: description)
                    habits.items.append(habit)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Add new habit")
        }
    }
}

#Preview {
    AddHabitView(habits: HabitsDM())
}
