//
//  DetailsView.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    let post: Post
    
    var body: some View {
        HStack {
            Group {
                if post.stickied {
                    Image(systemName: "pin.fill")
                        .rotationEffect(Angle(degrees: 45))
                        .foregroundColor(.green)
                } else {
                    Image(systemName: "pin")
                    .rotationEffect(Angle(degrees: 45))
                }
                Spacer()
            }
            ForEach([("arrow.up", "\(post.score)", Color.yellow), ("text.bubble", "\(post.num_comments)", Color.white)], id: \.0) { data in
                Group {
                    Image(systemName: data.0)
                    Text(data.1)
                    Spacer()
                }
                .foregroundColor(data.2)
            }
        }
        .background(Color.black)
    }
}
