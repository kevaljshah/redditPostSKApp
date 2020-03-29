//
//  PostView.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import SwiftUI
import Request

struct PostView: View {
    let post: Post
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(post.author)
                    .font(.caption)
                    .foregroundColor(Color.white)
                Text(post.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
            }.background(Color.black)
            if post.url.contains(".jpg") || post.url.contains(".png") {
                RequestImage(Url(post.url), contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
            }
            if post.selftext != "" {
                Text(post.selftext).foregroundColor(Color.white)
            }
            if post.flairs.count > 0 {
                
            }
            DetailsView(post: post)
            FlairListView(flairs: post.flairs)
        }
        .background(Color.black)
    }
}
