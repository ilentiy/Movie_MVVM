// MovieDetailData+CoreDataProperties.swift
// Copyright © Ilentiy. All rights reserved.

import CoreData
import Foundation

/// Расширение для подробной информации о фильме
public extension MovieDetailData {
    @nonobjc class func fetchRequest() -> NSFetchRequest<MovieDetailData> {
        NSFetchRequest<MovieDetailData>(entityName: "MovieDetailData")
    }

    /// Путь до фонового изображения
    @NSManaged var backdropPath: String?
    /// Бюджет
    @NSManaged var budget: Int64
    /// Домашняя страница
    @NSManaged var homepage: String?
    /// Идентификатор
    @NSManaged var id: Int64
    /// Язык оригинала
    @NSManaged var originalLanguage: String?
    /// Оригинальное название
    @NSManaged var originalTitle: String?
    /// Описание
    @NSManaged var overview: String?
    /// Популярность
    @NSManaged var popularity: Double
    /// Путь до изображения постера
    @NSManaged var posterPath: String?
    /// Дата выхода
    @NSManaged var releaseDate: String?
    /// Доход
    @NSManaged var revenue: Int64
    /// Продолжительность
    @NSManaged var runtime: Int64
    /// Статус
    @NSManaged var status: String?
    /// Слоган
    @NSManaged var tagline: String?
    /// Локализованное название
    @NSManaged var title: String?
    /// Средняя оценка
    @NSManaged var voteAverage: Double
    /// Количество голосов
    @NSManaged var voteCount: Int64
    /// Жанры
    @NSManaged var genres: NSSet?
}

/// Generated accessors for genres
public extension MovieDetailData {
    @objc(addGenresObject:)
    @NSManaged func addToGenres(_ value: GenreData)

    @objc(removeGenresObject:)
    @NSManaged func removeFromGenres(_ value: GenreData)

    @objc(addGenres:)
    @NSManaged func addToGenres(_ values: NSSet)

    @objc(removeGenres:)
    @NSManaged func removeFromGenres(_ values: NSSet)
}
