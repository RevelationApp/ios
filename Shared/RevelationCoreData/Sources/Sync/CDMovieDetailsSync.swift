import Restofire
import CoreData
import RevelationAPI

struct CDMovieDetailsSync: RSyncable {
    
    typealias Request = MovieDetailsGETService

    let context: NSManagedObjectContext
    let request: MovieDetailsGETService

    func shouldSync(completion: (Bool) throws -> ()) throws {
        /// <aarkay shouldSyncMovieDetailsSync>
        var shouldSync = false
        let movieId = request.pathModel.movieId
        try context.performAndWait {
            let movie = try CDMovie.fetch(id: Int64(movieId)!, context: context)!
            shouldSync = movie.detail == nil
        }
        try completion(shouldSync)
        /// </aarkay>
    }
    
    func insert(model: Request.Response, completion: @escaping () throws -> ()) throws {
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
        try completion()
        /// </aarkay>
    }
}
