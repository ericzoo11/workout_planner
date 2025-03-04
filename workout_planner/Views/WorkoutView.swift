//
//  WorkoutItemsView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Workout Plan")
            .toolbar {
                Button {
                    // Action
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    WorkoutView()
}
