//
//  BookCategoryListView.swift
//  NYTimesBestSellers-SwiftUI
//
//  Created by Farhana Mustafa on 5/26/24.
//

import Combine
import SwiftUI

/// Main view
/// Lists all supported book categories 
struct BookCategoryListView: View {
//    @ObservedObject var viewModel: BookViewModel
    
    var body: some View {
        List {
            ForEach(BookCategory.allCases, id: \.rawValue) { bookCategory in
                BookScrollView()
            }
        }
    }
}

#Preview {
    BookCategoryListView()
}
