//
//  LoginViewViewModel.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage =  ""
    
    init() {}
    
    func login(){
         
        guard validate() else{
            return
        }
        
        //try to log in
        Auth.auth().signIn(withEmail: email, link: password)
        
    }
    
    private func validate() -> Bool {
        
        // check email and password are not empty when login button is pressed
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
             errorMessage = "Please enter email and password"
            
            return false
        }
        
        // check that email contains @ and "." for it to be a valid email when login button is pressed
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email format"
            return false
        }
        
        return true
    }
}
