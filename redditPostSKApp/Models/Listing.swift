//
//  Listing.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import Foundation

struct CommentsList: Decodable {
    let data: CommentsListData
}

struct CommentsListData: Decodable {
    let children: [CommentsData]
}

struct CommentsData: Decodable {
    let data: Comment
}

struct Listing: Decodable {
    let data: ListingData
    
    enum CommentKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CommentKeys.self)
        data = try values.decode(ListingData.self, forKey: .data)
    }
}

struct ListingData: Decodable {
    let children: [PostData]
    
    enum CommentKeys: String, CodingKey {
        case children
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CommentKeys.self)
        children = try values.decode([PostData].self, forKey: .children)
    }
}

struct PostData: Decodable {
    let data: Post
}
