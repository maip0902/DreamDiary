
import Foundation
import RealmSwift

class Diary: Object {
    @objc dynamic var diaryId: String = UUID().uuidString
    @objc dynamic var userId: String = ""
    @objc dynamic var date : String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var imitation: String = ""
    
    override static func primaryKey() ->String? {
        return "diaryId"
    }
    
//    var authors = LinkingObjects(fromType: User.self, property: "diaries")
}
