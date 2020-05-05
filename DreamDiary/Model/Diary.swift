//
//  Diary.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/05.
//  Copyright © 2020 神田舞. All rights reserved.
//

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
