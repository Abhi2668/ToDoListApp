//
//  TamToDoListApp.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import FirebaseCore
import SwiftUI

@main
struct TamToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
