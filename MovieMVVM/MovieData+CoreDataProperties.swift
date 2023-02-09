// MovieData+CoreDataProperties.swift
// Copyright © Ilenty. All rights reserved.

import CoreData
import Foundation

public extension MovieData: Identifiable {
    @nonobjc class func fetchRequest() -> NSFetchRequest<MovieData> {
        NSFetchRequest<MovieData>(entityName: "MovieData")
    }

    @NSManaged var category: String?
    @NSManaged var id: UUID?
    @NSManaged var movieId: Int64
    @NSManaged var originalTitle: String?
    @NSManaged var overview: String?
    @NSManaged var posterPath: String?
    @NSManaged var releaseDate: String?
    @NSManaged var title: String?
    @NSManaged var voteAverage: Double
}
