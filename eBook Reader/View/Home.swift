//
//  Home.swift
//  eBook Reader
//
//  Created by Simec Sys Ltd. on 11/1/21.
//

import SwiftUI
import SDWebImageSwiftUI
import WebKit

struct Home: View {
    @ObservedObject var viewModel = BookViewModel()
    @State private var show: Bool = false
    @State var previewURL = ""
    
    var body: some View {
        List(viewModel.books) { book in
            HStack {
                if book.imurl != "" {
                    WebImage(url: URL(string: book.imurl))
                        .resizable()
                        .frame(width: 120, height: 170)
                } else {
                    Image(systemName: "character.book.closed.fill")
                        .font(.system(size: 60))
                        .frame(width: 120, height: 170)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(book.title)
                        .fontWeight(.bold)
                    Text(book.authors)
                    Text(book.desc)
                        .font(.system(size: 13))
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                }
            }
            .onTapGesture {
                self.previewURL = book.url
                show.toggle()
            }
        }
        .sheet(isPresented: $show) {
            NavigationView {
                WebView(url: $previewURL)
                    .navigationTitle("Book Preview")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
