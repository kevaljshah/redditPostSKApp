//
//  ListingViewModel.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import Foundation

class ListingViewModel: ObservableObject {
    @Published var listing = [ListingDetailsViewModel]()
    
    init() {
        RedditService().getPost() { listing in
            if let listing = listing {
                self.listing = listing.data.children.map(ListingDetailsViewModel.init)
            }
        }
    }
}

struct ListingDetailsViewModel {
    var postData: PostData
    
    init(postData: PostData) {
        self.postData = postData
    }
    
    var data: Post {
        return self.postData.data
    }
}

