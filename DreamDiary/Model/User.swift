//
//  User.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/04.
//  Copyright © 2020 神田舞. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var userId: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}
