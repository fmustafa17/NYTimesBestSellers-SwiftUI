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
    
    var body: some View {
        List {
            ForEach(BookCategory.allCases, id: \.rawValue) { bookCategory in
                BookScrollView(category: bookCategory.rawValue)
            }
        }
    }
}

#Preview {
    BookCategoryListView()
}
