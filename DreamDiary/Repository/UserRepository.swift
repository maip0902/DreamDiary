//
//  UserRepository.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/04.
//  Copyright © 2020 神田舞. All rights reserved.
//

protocol UserRepository {
    
    func create(name: String, email: String, password: String) -> User
    
}
