import Foundation
import CoreData
import RevelationDomain

@objc(CDMovieDetail)
class CDMovieDetail: NSManagedObject, CDDomainable {
    typealias CDModel = CDMovieDetail
    typealias DomainModel = MovieDetail

    @NSManaged var imdbId: String?
    @NSManaged var movie: CDMovie?

    static func asDomain(item: CDMovieDetail) -> MovieDetail {
        /// <aarkay asDomain>
        var model = MovieDetail()
        model.imdbId = item.imdbId
        return model
        /// </aarkay>
    }
}
