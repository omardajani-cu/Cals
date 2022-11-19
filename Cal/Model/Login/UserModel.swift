//
//  UserModel.swift
//  Cal
//
//  Created by Omar Dajani on 11/16/22.
//

import Foundation

class UserModel: ObservableObject {
    static var instance: UserModel? = nil
    @Published var uid: String = ""
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var username: String = ""
    @Published var signedIn: Bool = false
    @Published var role: Int = 0
    
    public init(uid: String, email: String, name: String, username: String, role: Int) {
        self.uid = uid
        self.email = email
        self.username = username
        self.name = name
        self.role = role
    }
}

class User: UserModel {
    
}

class Admin: UserModel {
    
}

class Moderator: UserModel {
    
}
