//
//  DetailView.swift
//  ReadMe
//
//  Created by Dominic Swaine on 28/06/2021.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            Book.Image(title: book.title)
                .frame(width: nil, height: nil)
            Spacer()
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
    }
}
