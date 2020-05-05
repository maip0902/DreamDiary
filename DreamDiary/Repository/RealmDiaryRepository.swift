//
//  RealmDiaryRepository.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/05.
//  Copyright © 2020 神田舞. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmDiaryRepository {
    
    func create(date: String, userId: String, body: String, imitation: String) -> Diary {
        let db: DB = DBConnect()
        var diary = Diary()
        diary.date = date
        diary.userId = userId
        diary.body = body
        diary.imitation = imitation
        
        db.save(diary)
        return diary
    }
}
