//
//  NewItemViewViewModel.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import FirebaseAuth
import FirebaseFirestore //our database
import Foundation


class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save(){
        guard canSave else{
            return
        }
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create a model
        let newId = UUID().uuidString //create a unique identifier
        let newItem = ExerciseItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore() // getting instance of our db
        
        //save the model to the database
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId) // new model id
            .setData(newItem.asDictionary()) // the [:] means a dictionary
        
    }
    
    //create a computed property
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        //subracting 86400 seconds (a full day, 24h, make sure its greater or equal to yesterday due to timezones)
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}

