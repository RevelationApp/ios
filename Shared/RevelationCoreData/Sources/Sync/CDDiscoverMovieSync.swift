
import CoreData
import RevelationAPI

struct CDDiscoverMovieSync: CoreDataSyncable {
    typealias Response = ResultResponseModel<PageResponseModel<MovieModel>>
    typealias Request = DiscoverMovieGETService

    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func request() -> Request {
        return DiscoverMovieGETService()
    }

    func shouldSync(completion: (Bool) throws -> ()) throws {
        /// <aarkay shouldSyncDiscoverMovieSync>
        let count = try CDMovie.count(context: context)
        try completion(count == 0)
        /// </aarkay>
    }

    func insert(model: Response, completion: () throws -> ()) throws {
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
