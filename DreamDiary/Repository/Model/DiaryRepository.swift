import Foundation
protocol DiaryRepository {
    func create(date: String, body: String, imitation: String, user: User) -> Diary
}
