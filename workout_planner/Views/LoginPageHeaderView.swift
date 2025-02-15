//
//  LoginPageHeaderView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct LoginPageHeaderView: View {
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                //.rotationEffect(Angle(degrees:10))
            VStack{
                Text("Workout Planner")
                    .font(.system(size:45))
                    .foregroundColor(Color.white)
                    .bold()
                Text("Let's get fit")
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
            }
            //.offset(y:30)
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y:-100)
    }
}

#Preview {
    LoginPageHeaderView()
}
