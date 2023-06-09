//
//  Comment.swift
//  MVC-N
//
//  Created by Evgenii Kutasov on 08.06.2023.
//

import Foundation

struct Comment {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
    init?(dictonary: [String: AnyObject]) {
        guard let postId = dictonary["postId"] as? Int,
              let id = dictonary["id"] as? Int,
              let email = dictonary["email"] as? String,
              let name = dictonary["name"] as? String,
              let body = dictonary["body"] as? String
        else { return nil }
        
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}
