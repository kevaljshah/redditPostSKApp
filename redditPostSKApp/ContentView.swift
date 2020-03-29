//
//  ContentView.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var postViewModel = ListingViewModel()
    
    /*init() {
        RedditService().getPost {
            print($0)
        }
    }*/
    var body: some View {
        PostView(post: postViewModel.listing[0].data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
