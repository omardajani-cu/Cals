//
//  PostModel.swift
//  Cal
//
//  Created by Omar Dajani on 11/18/22.
//

import Foundation

class PostModel: Identifiable {
    var id: Int
    var title: String
    var postedBy: String
    var body: String
    
    public init(id: Int, title: String, postedBy: String, body: String) {
        self.id = id
        self.title = title
        self.postedBy = postedBy
        self.body = body
    }
}

class Post: PostModel {
    
}

class StatusUpdate: PostModel {
    
}
