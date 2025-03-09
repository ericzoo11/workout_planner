//
//  WorkoutItemsView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct WorkoutView: View {
    
    @StateObject var viewModel = WorkoutViewViewModel()
    
    private let userId: String
    
    /// pass something through to the WorkoutViewViewModel Item
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Workout Plan")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    // also passing in the userId to the preview as we had to pass in the parameter above
    WorkoutView(userId: "")
}
