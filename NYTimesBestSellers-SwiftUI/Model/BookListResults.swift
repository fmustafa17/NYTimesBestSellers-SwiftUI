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
struct Book: Codable {
    let rank, rankLastWeek, weeksOnList, asterisk: Int
    let dagger: Int
    let primaryIsbn10, primaryIsbn13, publisher, description: String
    let price, title, author, contributor: String
    let contributorNote: String
    let bookImage: String?
    let bookImageWidth, bookImageHeight: Int?
    let amazonProductURL: String?
    let ageGroup, bookReviewLink, firstChapterLink, sundayReviewLink: String
    let articleChapterLink: String
    let isbns: [Isbn]
    let buyLinks: [BuyLink]
    let bookURI: String

    enum CodingKeys: String, CodingKey {
        case rank
        case rankLastWeek = "rank_last_week"
        case weeksOnList = "weeks_on_list"
        case asterisk, dagger
        case primaryIsbn10 = "primary_isbn10"
        case primaryIsbn13 = "primary_isbn13"
        case publisher, description, price, title, author, contributor
        case contributorNote = "contributor_note"
        case bookImage = "book_image"
        case bookImageWidth = "book_image_width"
        case bookImageHeight = "book_image_height"
        case amazonProductURL = "amazon_product_url"
        case ageGroup = "age_group"
        case bookReviewLink = "book_review_link"
        case firstChapterLink = "first_chapter_link"
        case sundayReviewLink = "sunday_review_link"
        case articleChapterLink = "article_chapter_link"
        case isbns
        case buyLinks = "buy_links"
        case bookURI = "book_uri"
    }
}

// MARK: - BuyLink
struct BuyLink: Codable {
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

// MARK: - Isbn
struct Isbn: Codable {
    let isbn10, isbn13: String
}
