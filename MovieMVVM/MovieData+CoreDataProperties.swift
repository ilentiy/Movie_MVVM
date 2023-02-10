// MovieData+CoreDataProperties.swift
// Copyright © Ilenty. All rights reserved.

import CoreData
import Foundation

/// Расширение для Фильма
public extension MovieData: Identifiable {
    @nonobjc class func fetchRequest() -> NSFetchRequest<MovieData> {
        NSFetchRequest<MovieData>(entityName: "MovieData")
    }

    /// Категория фильма
    @NSManaged var category: String?
    /// Идентификатор в БД
    @NSManaged var id: UUID?
    ///  Идентификатор фильма
    @NSManaged var movieId: Int64
    /// Оригинальное название
    @NSManaged var originalTitle: String?
    /// Описание
    @NSManaged var overview: String?
    /// Путь до изображения постера
    @NSManaged var posterPath: String?
    /// Дата выхода
    @NSManaged var releaseDate: String?
    /// Локализированное название фильма
    @NSManaged var title: String?
    /// Средняя оценка
    @NSManaged var voteAverage: Double
}
