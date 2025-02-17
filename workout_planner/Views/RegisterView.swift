//
//  RegisterView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI
    
struct RegisterView: View {
    
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        VStack{
            
            // Header
            HeaderView(title: "Register", subtitle: "Create a new account", angle: -15, background_color: .blue)
                .offset(y: -20)
            
            Form{
                TextField("First Name", text: $firstname)
                    .autocorrectionDisabled(true)
                
                TextField("Last Name", text: $lastname)
                    .autocorrectionDisabled(true)
                
                TextField("email", text: $email)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                
                SecureField("password", text: $password)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                
                WPButton(
                    title: "Create Account",
                    backgroundColor: .green)
                {
                    //Action when button is pressed
                    
                }
                .padding()
            }
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
