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
    @StateObject var viewModel: BookViewModel
    var category: String!
    
    init(category: String) {
        _viewModel = StateObject(wrappedValue: BookViewModel(category: category))
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if let books = viewModel.books {
                    ForEach(books, id: \.id) { book in
                        AsyncImage(url: URL(string: book.bookImage ?? ""))
                    }
                }
            }
        }
        .task {
            viewModel.fetchBookData()
        }
    }
}

#Preview {
    BookScrollView(category: "manga")
}
