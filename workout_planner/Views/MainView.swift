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
            accountView //abtracted below
        } else {
            LoginView()
        }
    }
    
    // this abstracts what was in the if statement but just puts it into its own computed property
    @ViewBuilder
    var accountView: some View {
        TabView{
            WorkoutView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.fill.turn.down")
                }
        }
    }
}

#Preview {
    MainView()
}
