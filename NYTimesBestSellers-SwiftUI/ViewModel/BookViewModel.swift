//
//  BookViewModel.swift
//  NYTimesBestSellers-SwiftUI
//
//  Created by Farhana Mustafa on 5/26/24.
//

import Combine
import Foundation

class BookViewModel: ObservableObject {
    @Published var booksResults: BookListResults?
    
    var category: String
    
    init(category: String) {
        self.category = category
    }
    
    func fetchBookData() {
        self.fetchBookListResults(
            with: category,
            successHandler: { [weak self] (results) in
                DispatchQueue.main.async {
                    self?.booksResults = results
                }
            }, errorHandler: { (error) in
                print(error)
            }
        )
    }
    
    private func fetchBookListResults(with category: String,
                                      successHandler: @escaping (BookListResults) -> Void,
                                      errorHandler: @escaping (Error) -> Void) {
        let baseURL = "https://api.nytimes.com/svc/books/v3/lists/current/"
        let apiKey = Config.apiKey.rawValue
        let fullURLString = baseURL + category + ".json?api-key=" + apiKey
        
        guard let url = URL(string: fullURLString) else {
            print("Couldn't retrieve a URL with \(fullURLString)")
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print("Error encounted:", error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data else {
                print("Something went wrong with data")
                return
            }
            
            do {
                let bookListResults = try JSONDecoder().decode(BookListResults.self,
                                                               from: data)
                successHandler(bookListResults)
            } catch {
                errorHandler(error)
            }
        }
        task.resume()
    }
}
