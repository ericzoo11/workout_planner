//
//  RegisterView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI
    
struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack{
            
            // Header
            HeaderView(title: "Register", subtitle: "Create a new account", angle: -15, background_color: .blue)
                .offset(y: -20)
            
            Form{
                TextField("First Name", text: $viewModel.firstname)
                    .autocorrectionDisabled(true)
                
                TextField("Last Name", text: $viewModel.lastname)
                    .autocorrectionDisabled(true)
                
                TextField("email", text: $viewModel.email)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                
                SecureField("password", text: $viewModel.password)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                
                WPButton(
                    title: "Create Account",
                    backgroundColor: .green)
                {
                    //Action when button is pressed
                    viewModel.register()
                    
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
