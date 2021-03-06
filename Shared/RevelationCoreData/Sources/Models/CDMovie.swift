import Foundation
import CoreData
import RevelationDomain

@objc(CDMovie)
class CDMovie: NSManagedObject, CDDomainable {
    typealias CDModel = CDMovie
    typealias DomainModel = Movie

    @NSManaged var id: Int64
    @NSManaged var title: String
    @NSManaged var overview: String
    @NSManaged var detail: CDMovieDetail?

    static func asDomain(item: CDMovie) -> Movie {
        /// <aarkay asDomain>
        let movie = Movie(
            id: Int(item.id),
            title: item.title,
            description: item.overview
        )
        return movie
        /// </aarkay>
    }
}

// MARK: Fetch Helper for id
extension CDMovie {
    static func fetch(id: Int64, context: NSManagedObjectContext) throws -> CDMovie? {
        let predicate = NSPredicate(format: "id == %d", id)
        let result = try CDMovie.fetch(context: context, predicate: predicate).first
        if result == nil { assertionFailure("Movie with \(id) doesn't exist in db") }
        return result
    }

    static func exists(id: Int64, context: NSManagedObjectContext) throws -> Bool {
        let predicate = NSPredicate(format: "id == %d", id)
        let count = try CDMovie.count(context: context, predicate: predicate)
        assert(count <= 1, "More than 1 Movie records found in db")
        return count == 1
    }
}
