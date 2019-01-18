import Restofire
import CoreData
import RevelationAPI

struct CDMovieDetailsSync: RSyncable {
    typealias Request = MovieDetailsGETService

    let context: NSManagedObjectContext
    let request: MovieDetailsGETService

    init(context: NSManagedObjectContext, movieId: String) {
        self.context = context
        self.request = MovieDetailsGETService(movieId: movieId)
    }

    func shouldSync() throws -> Bool {
        /// <aarkay shouldSyncMovieDetailsSync>
        var shouldSync = false
        let movieId = request.pathModel.movieId
        try context.performAndWait {
            let movie = try CDMovie.fetch(id: Int64(movieId)!, context: context)!
            shouldSync = movie.detail == nil
        }
        return shouldSync
        /// </aarkay>
    }

    func insert(model: Request.Response) throws {
        /// <aarkay insertMovieDetailsSync>
        guard let value = model.value else { throw model.error! }
        let movieId = request.pathModel.movieId
        try context.performAndWait {
            let movie = try CDMovie.fetch(id: Int64(movieId)!, context: context)!
            let detail = CDMovieDetail(context: context)
            detail.imdbId = value.imdbId
            detail.movie = movie
        }
        try context.save()
        /// </aarkay>
    }
}
