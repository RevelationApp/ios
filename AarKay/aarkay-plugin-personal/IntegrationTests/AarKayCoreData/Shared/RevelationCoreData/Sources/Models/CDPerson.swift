import Foundation
import CoreData

@objc(CDPerson)
class CDPerson: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPerson> {
        return NSFetchRequest<CDPerson>(entityName: "CDPerson")
    }

}
