import Foundation
import CoreData

@objc(CDString)
class CDString: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDString> {
        return NSFetchRequest<CDString>(entityName: "CDString")
    }

}
