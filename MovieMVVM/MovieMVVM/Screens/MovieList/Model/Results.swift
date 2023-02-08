// Results.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Результат запроса
struct Results: Codable {
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
    }

    /// Страница
    let page: Int
    /// Список фильмов
    let movies: [Movie]
}

/// Жанр
struct Genre: Codable {
    /// Название жанра
    let name: String
}
