//
//  ContentView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-14.
//

import SwiftUI

struct MainView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        LoginView()
        
    }
}

#Preview {
    MainView()
}
