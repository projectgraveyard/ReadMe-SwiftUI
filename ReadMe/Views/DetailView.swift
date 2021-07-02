//
//  DetailView.swift
//  ReadMe
//
//  Created by Dominic Swaine on 28/06/2021.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    let book: Book
    @Binding var image: UIImage?
    @State var showingImagePicker = false
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            VStack {
                Book.Image(title: book.title)
                Button(
                    "Update Image",
                    action: {showingImagePicker = true}
                )
                .padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
    }
}
