// MoviesCategory.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Категории фильмов
enum Category {
    case top
    case popular
    case upcoming

    var category: String {
        switch self {
        case .popular:
            return "popular"
        case .top:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        }
    }
}
