//
//  LoginView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            
            VStack {
                //Header
                HeaderView(title: "Workout Planner", subtitle:
                                        "Let's get fit", angle: 15, background_color: .mint)
                
                //Login Form
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    WPButton(title: "Log In", backgroundColor: .blue){
                        // Attempt login
                    }
                    .padding()
                }
                //Create Account
                VStack{
                    Text("Need an account?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
