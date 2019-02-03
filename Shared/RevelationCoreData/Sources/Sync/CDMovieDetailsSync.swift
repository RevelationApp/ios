import Restofire
import CoreData
import RevelationAPI

struct CDMovieDetailsSync: CDSyncable {
    typealias Request = MovieDetailsGETService

    let context: NSManagedObjectContext
    let request: Request

    func shouldSync(completion: (Bool) throws -> ()) throws {
        /// <aarkay shouldSyncMovieDetailsSync>
        let movieId = request.pathModel.movieId
        let movie = try CDMovie.fetch(id: Int64(movieId)!, context: context)!
        let shouldSync = movie.detail == nil
        try completion(shouldSync)
        /// </aarkay>
    }

    func insert(model: Request.Response, completion: @escaping () throws -> ()) throws {
        /// <aarkay insertMovieDetailsSync>
        guard let value = model.value else { throw model.error! }
        let movieId = request.pathModel.movieId
        let movie = try CDMovie.fetch(id: Int64(movieId)!, context: context)!
        let detail = CDMovieDetail(context: context)
        detail.imdbId = value.imdbId
        detail.movie = movie
        try completion()
        /// </aarkay>
    }
}
