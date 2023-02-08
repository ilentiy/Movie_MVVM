// Movie.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

///  Фильм
struct Movie: Codable {
    enum CodingKeys: String, CodingKey {
        case adult
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }

    /// Взрослый
    let adult: Bool
    /// Жанры
    let genreIDS: [Int]
    ///  Идентификатор фильма
    let id: Int
    /// Описание
    let originalTitle, overview: String
    /// Путь до изображения постера
    let posterPath: String
    /// Дата выхода
    let releaseDate: String
    /// Локализированное название фильма
    let title: String
    /// Средняя оценка
    let voteAverage: Double
}
