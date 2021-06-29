//
//  Book.swift
//  ReadMe
//
//  Created by Dominic Swaine on 26/06/2021.
//

struct Book: Hashable {
    let title: String
    let author: String
    
    init(title: String = "Title", author: String = "Author") {
        self.title = title
        self.author = author
    }
}
