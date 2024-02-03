//
//  ToDoListItemView.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated ,time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(hue: 1.0, saturation: 0.346, brightness: 0.406, opacity: 0.591))
                
                
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color(hue: 0.534, saturation: 0.71, brightness: 0.961, opacity: 0.917))
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123",
        title: "123",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: true))
}
