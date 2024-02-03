//
//  User.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email:String
    let joined: TimeInterval
}
