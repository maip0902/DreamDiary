
import Foundation
import RealmSwift
struct DBConnect: DB {
    
    func connect() -> Realm {
        let realm = try! Realm()
        return realm
    }
    
    func save(_ object: Object) {
        let realm = self.connect()
        try! realm.write {
            realm.add(object)
        }
    }
    
    func delete(_ object: Object) {
        let realm = self.connect()
        try! realm.write {
            realm.delete(object)
        }
    }
    
//    func append(user: User, diary: Diary) {
//        let realm = try! Realm()
//        try! realm.write {
//            user.diaries.append(diary)
//        }
//    }
}
