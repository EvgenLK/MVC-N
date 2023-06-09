//
//  GetCommentResponce.swift
//  MVC-N
//
//  Created by Evgenii Kutasov on 08.06.2023.
//

import Foundation

struct GetCommentResponse {
    typealias JSON = [[String: AnyObject]]
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? JSON else { throw NetworkError.failInternetError }
        
        var comments = [Comment]()
        
        for dictionary in array {
            guard let comment = Comment(dictonary: dictionary) else { continue }
            comments.append(comment)
        }
        
        self.comments = comments
    }
}
