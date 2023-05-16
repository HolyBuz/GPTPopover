//
//  WebView.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    let onDragHandler: () -> Void
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = ResizableWKWebView(onDragHandler: onDragHandler)
        webView.load(URLRequest(url: url))
        webView.autoresizingMask = [.width, .height]
        webView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        webView.setContentHuggingPriority(.defaultLow, for: .vertical)
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.load(URLRequest(url: url))
    }
    
}
