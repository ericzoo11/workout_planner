//
//  WorkoutViewViewModel.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import Foundation

/// ViewModel for a single workout list of items view (each row in item list)
/// Primary tab
class WorkoutViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    init() {}
    
    // delete the item on the list
    func delete(id: String){
        
    }
}
