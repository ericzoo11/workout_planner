//
//  NewItemsView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack  {
            Text ("New Item")
                .font(.system(size:32))
                .bold()
            Form {
                //Exercise Name (Title)
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due date?
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
            
                //Button
                WPButton(title: "Save",
                         backgroundColor: .pink){
                    viewModel.save()
                    
                }
                         .padding()
            }
        }
    }
}

#Preview {
    NewItemView()
}
