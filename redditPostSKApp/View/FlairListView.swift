//
//  FlairListView.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import SwiftUI

struct FlairListView: View {
    let flairs: [String]
    
    func addFlair(_ name: String) -> some View {
        Text(name)
            .font(.caption)
            .foregroundColor(Color.white)
            .padding(5)
            .background(Color.orange.opacity(0.25))
            .cornerRadius(3)
    }
    
    var body: some View {
        HStack {
            ForEach(flairs, id: \.self) {
                self.addFlair($0)
            }
        }
    }
}
