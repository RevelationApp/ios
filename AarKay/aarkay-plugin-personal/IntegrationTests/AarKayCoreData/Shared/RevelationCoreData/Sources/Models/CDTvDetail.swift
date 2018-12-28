import Foundation
import CoreData

@objc(CDTvDetail)
class CDTvDetail: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTvDetail> {
        return NSFetchRequest<CDTvDetail>(entityName: "CDTvDetail")
    }

}
