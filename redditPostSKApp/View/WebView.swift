//
//  UIWebView.swift
//  redditPostSKApp
//
//  Created by Keval Shah on 3/29/20.
//  Copyright © 2020 Keval Shah. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let request = URLRequest(url: URL(string: "https://ssl.reddit.com/api/v1/authorize?client_id=uI4j9t-z7eUMsA&response_type=code&state=TEST&redirect_uri=redittPostSKApp://response&duration=permanent&scope=read")!)
        let webView = WKWebView()
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}
