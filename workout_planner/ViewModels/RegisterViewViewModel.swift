//
//  RegisterViewViewModel.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           firstname: firstname,
                           lastname: lastname,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        // insert into database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool{
        
        //check that all the fields are not empty and that the email is good
        guard !firstname.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastname.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        //ensure the email contains "@" and contains "."
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        //ensure that password is greater than 6 charaters
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
