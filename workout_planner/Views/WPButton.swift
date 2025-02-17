//
//  WPButton.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-16.
//

import SwiftUI

struct WPButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        
        Button{
            
            // Action when clicking button
            action()
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    WPButton(title: "<title>", backgroundColor: .red){
        // action when button is pressed
    }
}
