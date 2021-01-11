//
//  ContentView.swift
//  eBook Reader
//
//  Created by Simec Sys Ltd. on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Books")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
