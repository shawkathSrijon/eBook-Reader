//
//  BookModel.swift
//  eBook Reader
//
//  Created by Simec Sys Ltd. on 11/1/21.
//

import Foundation

struct BookModel {
    var books: [Book] = []
    
    struct Book: Identifiable {
        var id: String
        var title: String
        var authors: String
        var desc: String
        var imurl: String
        var url: String
    }
}
