// Results.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Результат запроса
struct Results: Codable {
    let page: Int
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
    }
}

/// Жанр
struct Genre: Codable {
    let name: String
}
