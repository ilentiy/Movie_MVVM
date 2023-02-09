// Movie.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

///  Фильм
struct Movie: Codable {
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }

    ///  Идентификатор фильма
    let movieId: Int
    /// Оригинальное название
    let originalTitle: String
    /// Описание
    let overview: String
    /// Путь до изображения постера
    let posterPath: String
    /// Дата выхода
    let releaseDate: String
    /// Локализированное название фильма
    let title: String
    /// Средняя оценка
    let voteAverage: Double
}
