//
//  CalenderViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/12.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class CalenderViewController: CommonViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    var loginUser: User?
    @objc fileprivate weak var calendar: FSCalendar!
    
    let diary = RealmDiaryRepository()
    
    var year: Int = 1
    var month: Int = 1
    var dayDiary: Results<Diary>?
    
    @IBOutlet weak var diaryListView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = FSCalendar(frame: CGRect(x: screenHeight*0.05, y: screenHeight*0.15, width: screenWidth*0.8, height: screenHeight*0.6))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        self.calendar = calendar
        
        diaryListView.frame = CGRect(x:0, y:screenHeight*0.75, width:screenWidth, height:screenHeight*0.3)
    }
    
    // Tapされた時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        
        var date = year.description + "年" + month.description + "月" + day.description + "日"
        
        if let diary = diary.findByDay(date: date) {
            self.dayDiary = diary
            let child = self.children[0] as! DiaryListTableViewController
            child.diaries = diary
            child.tableView.reloadData()
        }
    }

    // カレンダー上の丸表示ロジック
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int{
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        
        var date = year.description + "年" + month.description + "月" + day.description + "日"
        
        if let diary = diary.findByDay(date: date) {
            self.dayDiary = diary
            return 1
        } else {
            return 0
        }
    }
}
