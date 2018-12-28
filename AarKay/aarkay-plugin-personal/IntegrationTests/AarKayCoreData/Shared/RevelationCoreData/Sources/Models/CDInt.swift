import Foundation
import CoreData

@objc(CDInt)
class CDInt: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDInt> {
        return NSFetchRequest<CDInt>(entityName: "CDInt")
    }

}
