// Movie.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///  Фильм
struct Movie: Codable {
    ///  Идентификатор фильма
    let adult: Bool
    ///  Оригинальное название фильма
    let genreIDS: [Int]
    /// Описание
    let id: Int
    /// Путь до изображения постера
    let originalTitle, overview: String
    /// Дата выхода
    let posterPath: String
    /// Локализированное название фильма
    let releaseDate: String
    /// Средняя оценка
    let title: String
    /// Коллекция
    let voteAverage: Double

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
}
