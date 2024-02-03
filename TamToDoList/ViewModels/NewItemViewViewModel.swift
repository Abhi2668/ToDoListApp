//
//  NewItemViewViewModel.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var titles = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        //Create a ToDoListItemModel
        //Save model to db as subcollection of current user
        //get user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID,
                                   title: titles,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todo")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !titles.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
