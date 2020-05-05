//
//  RealmDiaryRepository.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/05.
//  Copyright © 2020 神田舞. All rights reserved.
//

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
    
    func append(_ user: User, _ diary: Diary) {
        let realm = try! Realm()
        try! realm.write {
            user.diaries.append(diary)
        }
    }
}
