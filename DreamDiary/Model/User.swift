
import Foundation
import RealmSwift

class User: Object {
    // realmで生成されるid
    @objc dynamic var userId: String = UUID().uuidString
    // firebaseのuuid
    @objc dynamic var loginId: String = ""
    
    @objc dynamic var name: String = ""
    
    let diaries = List<Diary>()
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}
