//
//  Post.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: String
    let title: String
    let name: String
    
    let selftext: String
    let url: String
    let author: String
    let subreddit: String
    let score: Int
    let num_comments: Int
    let stickied: Bool
    
    let link_flair_text: String?
    let is_original_content: Bool
    let spoiler: Bool
    let locked: Bool
    let visited: Bool
    
    var flairs: [String] {
        var selected: [String] = []
        if link_flair_text != nil {
            selected.append(link_flair_text!)
        }
        if is_original_content {
            selected.append("Original Content")
        }
        if spoiler {
            selected.append("Spoiler")
        }
        if locked {
            selected.append("Locked")
        }
        if visited {
            selected.append("Visited")
        }
        return selected
    }
    
    let replies: [Self]?
}
