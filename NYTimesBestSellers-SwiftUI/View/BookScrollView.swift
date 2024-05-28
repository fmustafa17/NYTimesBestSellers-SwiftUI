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
        VStack {
            if let listName = viewModel.booksResults?.results.listName {
                Text(listName)
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if let books = viewModel.booksResults?.results.books {
                        ForEach(books, id: \.id) { book in
                            NavigationLink(destination: BookDetailView(book: book)) {
                                VStack {
                                    if let urlString = book.bookImage, let url = URL(string: urlString) {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 150)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    } else {
                                        Color.gray
                                            .frame(width: 100, height: 150)
                                    }
                                    Text(book.title)
                                        .font(.subheadline)
                                        .frame(width: 100)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                            }
                        }
                    } else {
                        Text("Loading...")
                            .padding()
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .task {
            viewModel.fetchBookData()
        }
    }
}

#Preview {
    BookScrollView(category: "manga")
}
