//
//  WebView.swift
//  eBook Reader
//
//  Created by Simec Sys Ltd. on 11/1/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var url: String
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}
