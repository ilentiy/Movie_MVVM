// MovieDetail.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Подробная Информация о фильме
struct MovieDetail: Codable {
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

    /// Путь до фонового изображения
    let backdropPath: String
    /// Бюджет
    let budget: Int
    /// Жанры
    let genres: [Genre]
    /// Домашняя страница
    let homepage: String
    /// Идентификатор
    let id: Int
    /// Язык оригинала
    let originalLanguage: String
    /// Оригинальное название
    let originalTitle: String
    /// Описание
    let overview: String
    /// Популярность
    let popularity: Double
    /// Путь до изображения постера
    let posterPath: String
    /// Дата выхода
    let releaseDate: String
    /// Доход
    let revenue: Int
    /// Продолжительность
    let runtime: Int
    /// Статус
    let status: String
    /// Слоган
    let tagline: String
    /// Локализованное название
    let title: String
    /// Средняя оценка
    let voteAverage: Double
    /// Количество голосов
    let voteCount: Int
}
