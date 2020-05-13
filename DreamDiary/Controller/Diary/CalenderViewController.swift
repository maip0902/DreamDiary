//
//  CalenderViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/12.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import FSCalendar
import Realm
class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    var loginUser: User?
    @objc fileprivate weak var calendar: FSCalendar!
    let diaryTitle = UIButton()
    
    let diary = RealmDiaryRepository()
    
    var year: Int = 1
    var month: Int = 1
    var dayDiary: Diary?
    
    @IBOutlet weak var footer: UIView!
    
    @IBOutlet weak var diaryListView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let calendar = FSCalendar(frame: CGRect(x: screenHeight*0.05, y: screenHeight*0.15, width: screenWidth*0.8, height: screenHeight*0.6))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        self.calendar = calendar
        // Do any additional setup after loading the view.
        
        let layout = CustomLayout(screenWidth, screenHeight)
        layout.setPositionByRatio(0, 0.8, 1, 0.1, uiContent: self.diaryTitle)
        diaryTitle.addTarget(self, action: #selector(showDiary), for: UIControl.Event.touchUpInside)
        self.view.addSubview(diaryTitle)
        layout.setFooter(footer)
        diaryListView.frame = CGRect(x:0, y:screenHeight*0.75, width:screenWidth, height:screenHeight*0.1)
    }
    
    @objc func showDiary() {
        let storybord : UIStoryboard = self.storyboard!
        let nextView = storyboard?.instantiateViewController(identifier: "diaryDetail") as! DiaryDetailViewController
        nextView.diary = dayDiary
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    // Tapした時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.diaryTitle.setTitle("", for: UIControl.State.normal)
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)

        var date = year.description + "年0" + month.description + "月" + day.description + "日"
        if let diary = diary.findByDay(date: date) {
//            self.diaryTitle.setTitle(diary.body, for: UIControl.State.normal)
//            self.dayDiary = diary
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int{
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        
        var date = year.description + "年0" + month.description + "月" + day.description + "日"
        
        if let diary = diary.findByDay(date: date) {
            return 1
        } else {
            return 0
        }
    }
}
