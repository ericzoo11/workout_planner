//
//  WorkoutItemsView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import FirebaseFirestore
import SwiftUI

struct WorkoutView: View {
    
    @StateObject var viewModel: WorkoutViewViewModel
    @FirestoreQuery var items: [ExerciseItem] //a query that will continuously listen for items
    
    /// pass something through to the WorkoutViewViewModel Item
    init(userId: String) {
        
        //users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/exercise_item") // this goes to firebase and in the path, it pulls the data into the "items" variable
        
        //assign the view model so that we can pass in the userId
        self._viewModel = StateObject(
            wrappedValue: WorkoutViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ExerciseItemView(item: item)
                        .swipeActions { //swipe action modifier
                            Button("Delete"){
                                //Delete the item
                                viewModel.delete(id: item.id)
                            }.tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
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
    WorkoutView(userId: "19TKfZ9IgkQ3oLKlcT8R9iAAu2R2")
}
