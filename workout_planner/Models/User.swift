//
//  User.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import Foundation

struct User: Codable {
    
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    let joined: TimeInterval // when did they sign up
    
    
}
