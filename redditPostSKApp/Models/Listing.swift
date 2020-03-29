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
}

struct ListingData: Decodable {
    let children: [PostData]
}

struct PostData: Decodable {
    let data: Post
}
