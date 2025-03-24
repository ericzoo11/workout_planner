//
//  ExerciseItemView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct ExerciseItemView: View {
    
    @StateObject var viewModel = ExerciseItemViewViewModel()
    
    let item: ExerciseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color.red)
            }
            
            Spacer()
            
            Button(){
                // button is pressed, toggle the checkmark
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName:item.isDone ?
                      "checkmark.circle.fill" : "circle")
                .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    ExerciseItemView(item: .init(id: "123", title: "Push Ups", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
