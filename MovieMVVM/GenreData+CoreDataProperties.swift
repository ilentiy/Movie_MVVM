// GenreData+CoreDataProperties.swift
// Copyright © Ilenty. All rights reserved.

import CoreData
import Foundation

/// расширение для жанра
public extension GenreData {
    @nonobjc class func fetchRequest() -> NSFetchRequest<GenreData> {
        NSFetchRequest<GenreData>(entityName: "GenreData")
    }

    /// Название жанра
    @NSManaged var name: String?
}
