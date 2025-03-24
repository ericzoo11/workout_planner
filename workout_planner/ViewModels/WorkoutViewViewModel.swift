//
//  WorkoutViewViewModel.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//
import FirebaseFirestore
import Foundation

/// ViewModel for a single workout list of items view (each row in item list)
/// Primary tab
class WorkoutViewViewModel: ObservableObject {

    @Published var showingNewItemView = false

    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    /// Delete the item on the list
    ///  - Parameter id: Items id to delete
    func delete(id: String){
        //get a reference to our firebase db
        let db = Firestore.firestore()
        
        //modify the data base elements
        db.collection("users")
            .document(userId)
            .collection("exercise_item")
            .document(id)
            .delete()
    }
}
