//
//  LoginView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack {
                //Header
                HeaderView(title: "Workout Planner", subtitle:
                                        "Let's get fit", angle: 15, background_color: .mint)
                //Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    WPButton(title: "Log In", backgroundColor: .blue){
                        viewModel.login()
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
