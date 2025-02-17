//
//  LoginPageHeaderView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background_color: Color
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background_color)
                .rotationEffect(Angle(degrees:angle))
            VStack{
                Text(title)
                    .font(.system(size:45))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(Color.white)
            }
            //.offset(y:30)
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y:-120)
    }
}

#Preview {
   HeaderView(title: "Title", subtitle: "Subtitle", angle: 20, background_color: Color.pink)
}
