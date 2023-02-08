// MovieDetails.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Подробная Информация о фильме
struct MovieDetails: Codable {
    ///  Идентификатор фильма
    let backdropPath: String
    /// Путь до фонового изображения
    let budget: Int
    /// Бюджет
    let genres: [Genre]
    /// Домашняя страница
    let homepage: String
    /// Язык оригинала
    let id: Int
    /// Оригинальное название
    let originalLanguage: String
    /// Описание
    let originalTitle: String
    /// Популярность
    let overview: String
    /// Путь до изображения постера
    let popularity: Double
    /// Дата выхода
    let posterPath: String
    /// Доход
    let releaseDate: String
    /// Продолжительность
    let revenue: Int
    /// Статус
    let runtime: Int
    /// Слоган
    let status: String
    /// Локализованное название
    let tagline: String
    /// Средняя оценка
    let title: String
    /// Количество голосов
    let voteAverage: Double
    ///  Идентификатор фильма
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case homepage
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case status
        case tagline
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
