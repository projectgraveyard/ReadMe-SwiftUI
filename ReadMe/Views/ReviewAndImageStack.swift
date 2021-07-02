//
//  ReviewAndImageStack.swift
//  ReadMe
//
//  Created by Dominic Swaine on 02/07/2021.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct ReviewAndImageStack: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    @State var showingImagePicker = false
    @State var showingDeleteAlert = false
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical)
            TextField("Review...", text: $book.microReview)
            Divider()
                .padding(.vertical)
            Book.Image(
                uiImage: image,
                title: book.title,
                cornerRadius: 16
            )
            .scaledToFit()
            
            let updateButton = Button(
                "Update Image",
                action: {showingImagePicker = true}
            )
            
            if image != nil {
                HStack {
                    Spacer()
                    Button(
                        "Delete Image",
                        action: {showingDeleteAlert = true}
                    )
                    Spacer()
                    updateButton
                    Spacer()
                }
            } else {updateButton}
            Spacer()
        }
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .alert(isPresented: $showingDeleteAlert) {
            .init(
                title: .init("Delete image for \(book.title)?"),
                primaryButton: .destructive(.init("Delete")){image = nil},
                secondaryButton: .cancel()
            )
        }
    }
}

struct ReviewAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImageStack(book: .init(), image: .constant(nil))
            .padding(.horizontal)
            .previewedInAllColorSchemes
    }
}

