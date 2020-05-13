
import Foundation
import RealmSwift

struct RealmDiaryRepository: DiaryRepository {
    
    func create(date: String, body: String, imitation: String, user: User) -> Diary {
        let db = DBConnect()
        let diary = Diary()
        diary.date = date
        diary.body = body
        diary.imitation = imitation
        
        db.save(diary)
        self.append(user, diary)
        return diary
    }
    
    func findByDiaryId(diaryId: String) -> Diary? {
        let db = DBConnect()
        let realm = db.connect()
        let diary = realm.objects(Diary.self).filter("diaryId == '\(diaryId)'")
        
        return diary.count != 0 ? diary[0] : nil
    }
    
    func append(_ user: User, _ diary: Diary) {
        let realm = try! Realm()
        try! realm.write {
            user.diaries.append(diary)
        }
    }
    
    func findByDay(date: String) -> Results<Diary>? {
        let db = DBConnect()
        let realm = db.connect()
        let diary = realm.objects(Diary.self).filter("date == '\(date)'")
        print(diary)
        return diary.count != 0 ? diary : nil
    }
}
