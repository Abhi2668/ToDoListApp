//
//  NewItemView.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Form {
                TextField("Title", text: $viewModel.titles)
                    .textFieldStyle(DefaultTextFieldStyle())
            
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Add Item", bg: Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.299)) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding(10)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text("Ensure all fields are filled and has an appropriate due date."))
                }
            }
            .tint(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.299))
            .background(Color(hue: 0.087, saturation: 1.0, brightness: 1.0, opacity: 0.062))
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true}, set: { _ in
            
        }))
}
