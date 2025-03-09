//
//  ExerciseItem.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import Foundation

struct ExerciseItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool // this is a var because we want it to be mutatable
    
    //mutating function
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
