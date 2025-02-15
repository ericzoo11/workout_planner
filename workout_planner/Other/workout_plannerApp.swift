//
//  workout_plannerApp.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-14.
//

import FirebaseCore
import SwiftUI

@main
struct workout_plannerApp: App {
    
    // stub out initializer
    init () {
        FirebaseApp.configure()
    }
    var body: some
    Scene {
        WindowGroup {
            MainView()
        }
    }
}
