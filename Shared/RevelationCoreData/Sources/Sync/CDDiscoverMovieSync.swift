import Restofire
import CoreData
import RevelationAPI

struct CDDiscoverMovieSync: CDSyncable {
    typealias Request = DiscoverMovieGETService

    let context: NSManagedObjectContext
    let request: Request

    func shouldSync(completion: (Bool) throws -> ()) throws {
        /// <aarkay shouldSyncDiscoverMovieSync>
        let shouldSync = try CDMovie.count(context: context) == 0
        try completion(shouldSync)
        /// </aarkay>
    }

    func insert(model: Request.Response, completion: @escaping () throws -> ()) throws {
        /// <aarkay insertDiscoverMovieSync>
        guard let value = model.value else { throw model.error! }
        value.results.forEach { item in
            let cdItem = CDMovie(context: context)
            cdItem.id = Int64(item.id)
            cdItem.title = item.title
            cdItem.overview = item.overview
        }
        try completion()
        /// </aarkay>
    }
}
