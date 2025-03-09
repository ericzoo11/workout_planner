//
//  NewItemsView.swift
//  workout_planner
//
//  Created by Eric Zhu on 2025-02-15.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack  {
            Text ("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 50)
            Form {
                //Exercise Name (Title)
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due date?
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
            
                //Button
                WPButton(title: "Save",
                         backgroundColor: .pink
                ){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true //show an alert if not saved properly
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert (title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or later"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
    }))
}
