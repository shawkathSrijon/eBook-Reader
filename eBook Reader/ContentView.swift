//
//  ContentView.swift
//  eBook Reader
//
//  Created by Simec Sys Ltd. on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = BookViewModel(searchText: "harry+potter")

    var body: some View {
        CustomNavigationView(view: AnyView(Home(viewModel: viewModel)), placeHolder: "Search", largeTitle: true, title: "Books") { (text) in
            if text != "" {
                BookViewModel(searchText: text.lowercased().replacingOccurrences(of: " ", with: "+"))
            }
        } onCancel: {
            BookViewModel(searchText: "harry+potter")
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
