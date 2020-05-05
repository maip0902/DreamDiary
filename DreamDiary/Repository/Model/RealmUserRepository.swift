//
//  RealmUserRepository.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/04.
//  Copyright © 2020 神田舞. All rights reserved.
//

import Foundation
import RealmSwift
struct RealmUserRepository : UserRepository {
    
    // 辞書型で渡すべきか悩み中
    func create(name: String, email: String, password: String) -> User {
        let db = DBConnect()
        let user = User()
        user.name = name
        user.email = email
        user.password = password
        
        db.save(user)
        return user
    }
}
