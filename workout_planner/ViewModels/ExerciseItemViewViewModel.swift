//
//  ExerciseItemViewViewModel.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ExerciseItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone (item: ExerciseItem){
        
        var itemCopy = item // need to create a copy of it otherwise it won't work
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("exercise_item")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}

