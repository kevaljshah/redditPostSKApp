//
//  ContentView.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import SwiftUI
import Request

struct ContentView: View {
    
    @ObservedObject private var postViewModel = ListingViewModel()
    
    /*init() {
        RedditService().getPost {
            print($0)
        }
    }*/
    var body: some View {
        NavigationView {
            RequestView(Listing.self, Request {
                Url("https://www.reddit.com/r/nextfuckinglevel/fqlide.json")
                Header.Accept(.json)
            }) { listings in
                if listings != nil {
                    ForEach(listings!.dropLast().map({ $0.data.children }).map ({ $0.data }), id: \.id) { post in
                            PostView(post: post)
                    }
                }
            }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(trailing: HStack {
            Button(action: {
                self.showLoginWebView()
            }) {
                HStack {
                    Text("Login")
                }
            }
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
