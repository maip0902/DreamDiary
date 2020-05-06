
import Foundation
import RealmSwift
struct RealmUserRepository : UserRepository {
    
    // 辞書型で渡すべきか悩み中
    func create(loginId: String, name: String) -> User {
        let db = DBConnect()
        let user = User()
        user.loginId = loginId
        user.name = name
        db.save(user)
        
        return user
    }
    
    func findByLoginId(loginId: String) -> User? {
        let db = DBConnect()
        let realm = db.connect()
        let user =  realm.objects(User.self).filter("loginId == '\(loginId)'")

        // 見つからなければnilを返す
        return user.count != 0 ? user[0] : nil
    }
}
