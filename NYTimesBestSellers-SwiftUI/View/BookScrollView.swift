//
//  BookScrollView.swift
//  NYTimesBestSellers-SwiftUI
//
//  Created by Farhana Mustafa on 5/26/24.
//

import SwiftUI

/// Reusable component
/// Horizontal scrolling for all the best sellers for the given category
struct BookScrollView: View {
    @StateObject var viewModel: BookViewModel = BookViewModel()

    var body: some View {
        ScrollView(.horizontal) {
            if let books = viewModel.books {
                ForEach(books, id: \.id) { book in
                    let urlString = book.bookImage ?? ""
                    AsyncImage(url: URL(string: urlString))
                    
                }
            }
        }
        .task {
            viewModel.fetchBookData()
        }
    }
}

#Preview {
    BookScrollView()
}
