//
//  BookDetailView.swift
//  NYTimesBestSellers-SwiftUI
//
//  Created by Farhana Mustafa on 5/26/24.
//

import SwiftUI

struct BookDetailView: View {
    var book: Book

    var body: some View {
        ScrollView {
            VStack {
                if let bookImage = book.bookImage {
                    AsyncImage(url: URL(string: bookImage)) { image in
                        image
                            .resizable()
                    }  placeholder: {
                        ProgressView()
                    }
                    .padding()
                }
                
                Text(book.title)
                    .font(.largeTitle)
                
                Text(book.author)
                    .font(.headline)
                
                Spacer()

                Text(book.description)
                    .font(.subheadline)
                    .padding()
            }
        }
    }
}
