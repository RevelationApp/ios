import Foundation
import CoreData

@objc(CDMovieDetail)
class CDMovieDetail: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMovieDetail> {
        return NSFetchRequest<CDMovieDetail>(entityName: "CDMovieDetail")
    }

}
