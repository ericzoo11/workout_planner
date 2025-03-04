//
//  ContentView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-14.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        //if user is signed in, show the workout view
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView{
                WorkoutView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person")
                    }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
