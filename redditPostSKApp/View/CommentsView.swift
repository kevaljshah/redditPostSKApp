//
//  CommentsView.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import SwiftUI
import Request

struct CommentsView: View {
    let post: Post
    
    var body: some View {
        /*RequestView([CommentsList].self, Request {
            Url("https://www.reddit.com/r/nextfuckinglevel/fqlide.json")
            Header.Accept(.json)
        }) { listings in
            if listings != nil {
                if listings!.dropFirst().map({ $0.data.children }).map ({ $0.data }).count > 0 {
                    ForEach(listings!.dropFirst().map({ $0.data.children }).map ({ $0.data }), id: \.id) { comment in
                        CommentDetailView(comment: comment, postAuthor: self.post.author, subTreeLevel: 0)
                    }
                } else {
                    Text("No Comments")
                }
            } else {
                Text("No Comments")
            }*/
            Text("No Comment")
        }
    }

struct CommentDetailView: View {
    let comment: Comment
    let postAuthor: String
    let subTreeLevel: Int

    var authorText: some View {
        if comment.author == postAuthor {
            return Text(comment.author).foregroundColor(.blue).bold()
        } else {
            return Text(comment.author)
        }
    }
    
    var body: some View {
        Group {
            HStack {
                if subTreeLevel > 0 {
                    RoundedRectangle(cornerRadius: 1.5)
                        .foregroundColor(Color(hue: 1.0 / Double(subTreeLevel), saturation: 1.0, brightness: 1.0))
                        .frame(width: 5)
                }
                VStack(alignment: .leading) {
                    authorText
                        .font(.caption)
                    Text(comment.body ?? "")
                }
            }
            .padding(.leading, CGFloat(self.subTreeLevel * 20))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
            if comment.replies != nil {
                ForEach(comment.replies!.data.children.map { $0.data }, id: \.id) { reply in
                    CommentDetailView(comment: reply, postAuthor: self.postAuthor, subTreeLevel: self.subTreeLevel + 1)
                }
            }
        }
    }
}
