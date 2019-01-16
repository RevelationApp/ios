import Restofire
import CoreData
import RevelationAPI

struct CDMovieDetailsSync: CoreDataSyncable {
    typealias Response = ResultResponseModel<MovieDetailsModel>
    typealias Request = MovieDetailsGETService

    let context: NSManagedObjectContext
    let movieId: String

    init(context: NSManagedObjectContext, movieId: String) {
        self.context = context
        self.movieId = movieId
    }

    func request() -> Request {
        return MovieDetailsGETService(movieId: movieId)
    }

    func shouldSync(completion: (Bool) throws -> ()) throws {
        /// <aarkay shouldSyncMovieDetailsSync>
        let movie = try CDMovie.fetch(id: Int64(movieId)!, context: context)!
        try completion(movie.detail == nil)
        /// </aarkay>
    }

    func insert(model: Response, completion: () throws -> ()) throws {
        /// <aarkay insertMovieDetailsSync>
        guard let value = model.value else { throw model.error! }
        let movie = try CDMovie.fetch(id: Int64(movieId)!, context: context)!
        let detail = CDMovieDetail(context: context)
        detail.imdbId = value.imdbId
        detail.movie = movie
        try completion()
        /// </aarkay>
    }
}
