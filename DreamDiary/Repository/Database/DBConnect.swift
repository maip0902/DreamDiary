//
//  Database.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/05.
//  Copyright © 2020 神田舞. All rights reserved.
//

import Foundation
import RealmSwift
struct DBConnect: DB {
    
    func save(_ object: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object)
        }
    }
    
//    func append(user: User, diary: Diary) {
//        let realm = try! Realm()
//        try! realm.write {
//            user.diaries.append(diary)
//        }
//    }
}
