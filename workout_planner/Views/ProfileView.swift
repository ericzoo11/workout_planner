//
//  ProfileView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                //Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 125, height: 125)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                //Info: Name, Email, member since...
                VStack(alignment: .leading){
                    HStack{
                        Text("Name:")
                            .bold()
                        Text("Eric Zhu")
                    }
                    HStack{
                        Text("Email:")
                            .bold()
                        Text("Eric Zhu")
                    }
                    HStack{
                        Text("Member Since:")
                            .bold()
                        Text("Eric Zhu")
                    }
                    
                    Button("Log Out"){
                        //action when pressing the button
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    
                    Spacer()
                }
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
