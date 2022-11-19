//
//  UserFactory.swift
//  Cal
//
//  Created by Omar Dajani on 11/17/22.
//

import Foundation

class UserFactory {
    func factory(uid: String, email: String, name: String, username: String, role: Int) -> UserModel {
        var user: UserModel
        
        if (role == 0) {
            user = User(uid: uid, email: email, name: name, username: username, role: role)
        } else if (role == 1) {
            user = Moderator(uid: uid, email: email, name: name, username: username, role: role)
        } else {
            user = Admin(uid: uid, email: email, name: name, username: username, role: role)
        }
        
        return user
    }
}
