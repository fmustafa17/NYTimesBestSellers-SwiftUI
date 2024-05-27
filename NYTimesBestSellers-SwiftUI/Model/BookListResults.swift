//
//  BookListResults.swift
//  NYTimesBestSellers-SwiftUI
//
//  Created by Farhana Mustafa on 5/26/24.
//

import Foundation

struct BookListResults: Codable {
    let numResults: Int
    let results: Results

    enum CodingKeys: String, CodingKey {
        case numResults = "num_results"
        case results
    }
}

// MARK: - Results
struct Results: Codable {
    let listName, listNameEncoded, bestsellersDate, publishedDate: String
    let publishedDateDescription, nextPublishedDate, previousPublishedDate, displayName: String
    let normalListEndsAt: Int
    let updated: String
    let books: [Book]

    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case listNameEncoded = "list_name_encoded"
        case bestsellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case publishedDateDescription = "published_date_description"
        case nextPublishedDate = "next_published_date"
        case previousPublishedDate = "previous_published_date"
        case displayName = "display_name"
        case normalListEndsAt = "normal_list_ends_at"
        case updated, books
    }
}

// MARK: - Book
struct Book: Identifiable, Codable, Hashable {
    let id = UUID().uuidString
    let description, title, author: String
    let bookImage: String?
    let bookImageWidth, bookImageHeight: Int?
    let amazonProductURL: String?
    let bookReviewLink, sundayReviewLink: String
    let articleChapterLink: String
    let buyLinks: [BuyLink]
    let bookURI: String

    enum CodingKeys: String, CodingKey {
        case id
        case description, title, author
        case bookImage = "book_image"
        case bookImageWidth = "book_image_width"
        case bookImageHeight = "book_image_height"
        case amazonProductURL = "amazon_product_url"
        case bookReviewLink = "book_review_link"
        case sundayReviewLink = "sunday_review_link"
        case articleChapterLink = "article_chapter_link"
        case buyLinks = "buy_links"
        case bookURI = "book_uri"
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        true
    }
}

// MARK: - BuyLink
struct BuyLink: Codable, Hashable {
    let name: Name
    let url: String
}

enum Name: String, Codable {
    case amazon = "Amazon"
    case appleBooks = "Apple Books"
    case barnesAndNoble = "Barnes and Noble"
    case booksAMillion = "Books-A-Million"
    case bookshop = "Bookshop"
    case indieBound = "IndieBound"
}
