//
//  DiaryRepository.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/05.
//  Copyright © 2020 神田舞. All rights reserved.
//

import Foundation
protocol DiaryRepository {
    func create(date: String, userId: String, body: String, imitation: String) -> Diary
}
