//
//  RedditService.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import Foundation

struct RedditService {
    func getPost(completion: @escaping (Listing?) -> ()) {
        guard let url = URL(string: "https://www.reddit.com/r/nextfuckinglevel/fqlide.json") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
                let posts = try? JSONDecoder().decode(Listing.self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            } else {
                 DispatchQueue.main.async {
                     completion(nil)
                 }
            }
        }.resume()
    }
}
