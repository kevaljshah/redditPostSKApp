//
//  Comment.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    let id: String
    let author: String
    let body: String?
    let edited: Bool
    let replies: CommentsList?
    
    enum CommentKeys: String, CodingKey {
        case id
        case author
        case body
        case edited
        case replies
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CommentKeys.self)
        id = try values.decode(String.self, forKey: .id)
        author = try values.decode(String.self, forKey: .author)
        body = try? values.decode(String.self, forKey: .body)
        edited = try values.decode(Bool.self, forKey: .edited)
        
        if let replies = try? values.decode(CommentsList.self, forKey: .replies) {
            self.replies = replies
        } else {
            replies = nil
        }
    }
}
