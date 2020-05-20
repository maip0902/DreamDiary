import Foundation
import RealmSwift
protocol DiaryRepository {
    func create(date: String, body: String, imitation: String, user: User) -> Diary
    func update(date: String, body: String, imitation: String, diary: Diary) -> Diary
    func findByDiaryId(diaryId: String) -> Diary?
    func findByDay(date: String) -> Results<Diary>?
}
