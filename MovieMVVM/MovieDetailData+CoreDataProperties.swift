// MovieDetailData+CoreDataProperties.swift
// Copyright © Ilenty. All rights reserved.

import CoreData
import Foundation

public extension MovieDetailData {
    @nonobjc class func fetchRequest() -> NSFetchRequest<MovieDetailData> {
        NSFetchRequest<MovieDetailData>(entityName: "MovieDetailData")
    }

    @NSManaged var backdropPath: String?
    @NSManaged var budget: Int64
    @NSManaged var homepage: String?
    @NSManaged var id: Int64
    @NSManaged var originalLanguage: String?
    @NSManaged var originalTitle: String?
    @NSManaged var overview: String?
    @NSManaged var popularity: Double
    @NSManaged var posterPath: String?
    @NSManaged var releaseDate: String?
    @NSManaged var revenue: Int64
    @NSManaged var runtime: Int64
    @NSManaged var status: String?
    @NSManaged var tagline: String?
    @NSManaged var title: String?
    @NSManaged var voteAverage: Double
    @NSManaged var voteCount: Int64
    @NSManaged var genres: NSSet?
}

// MARK: Generated accessors for genres

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
