//
//  BookViewModel.swift
//  eBook Reader
//
//  Created by Simec Sys Ltd. on 11/1/21.
//

import Foundation
import SwiftyJSON

class BookViewModel: ObservableObject {
    @Published var model = BookModel()
    
    init() {
        let url = "https://www.googleapis.com/books/v1/volumes?q=harry+potter"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (resp, _, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                return
            }
            let json = try! JSON(data: resp!)
            let items = json["items"].array!
            
            for item in items {
                let id = item["id"].stringValue
                let title = item["volumeInfo"]["title"].stringValue
                let authors = item["volumeInfo"]["authors"].array ?? []
                var author: String = ""
                for name in authors {
                    author += "\(name.stringValue)"
                }
                let description = item["volumeInfo"]["description"].stringValue
                let imurl = item["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
                let webReaderLink = item["volumeInfo"]["previewLink"].stringValue
                print(webReaderLink)
                
                DispatchQueue.main.async {
                    self.model.books.append(BookModel.Book(id: id, title: title, authors: author, desc: description, imurl: imurl, url: webReaderLink))
                }
            }
        }
        .resume()
    }
    
    //MARK:- Access to the model
    
    var books: [BookModel.Book] {
        model.books
    }
}
