//
//  DiaryEditViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/17.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit

class DiaryEditViewController: CommonViewController {

    var diary: Diary?
    let date = UITextField()
    let body = UITextView()
    let imitation = UITextView()
    var datePicker: UIDatePicker = UIDatePicker()
    let realmDiary = RealmDiaryRepository()
    let errorMessage = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = CustomLayout(screenWidth, screenHeight)
        
        let dateLabel = UILabel()
        let bodyLabel = UILabel()
        let imitationLabel = UILabel()
        dateLabel.text = "日付"
        bodyLabel.text = "本文"
        imitationLabel.text = "意味"
        
        layout.spaceBetweenHeightLabel(uiContents: [dateLabel, bodyLabel], space: 0.2, 0.1, 0.2, 0.5, 0.05)
        layout.setLabelPositionByRatio(0.1, 0.5, 0.3, 0.05, uiContent: imitationLabel)
        layout.setLabelPositionByRatio(0.1, 0.6, 0.8, 0.1, uiContent: errorMessage)
        self.view.addSubview(dateLabel)
        self.view.addSubview(bodyLabel)
        self.view.addSubview(imitationLabel)
        self.view.addSubview(errorMessage)
        
        body.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.3, width:screenWidth*0.5, height:screenHeight*0.15)
        imitation.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.5, width:screenWidth*0.5, height:screenHeight*0.1)
        
        self.view.addSubview(body)
        self.view.addSubview(imitation)
        
        if let diaryItem = diary {
            date.text = diaryItem.date
            body.text = diaryItem.body
            imitation.text = diaryItem.imitation
        }
        
        let saveButton = UIButton()
        saveButton.setTitle("保存", for: UIControl.State.normal)
        layout.centeringWidth(saveButton, 0.7, 0.6, 0.1)
        layout.setOutlet(saveButton, radius: 0.1, borderWidth: 2, color: UIColor(red: 255, green: 128, blue: 134, alpha: 1.0).cgColor)
        saveButton.addTarget(self, action: #selector(save), for: UIControl.Event.touchUpInside)
        self.view.addSubview(saveButton)
        
        // datePicker
        datePicker.datePickerMode = UIDatePicker.Mode.date
        date.inputView = datePicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        date.inputView = datePicker
        date.inputAccessoryView = toolbar
        date.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.2, width:screenWidth*0.5, height:screenHeight*0.05)
        date.backgroundColor = UIColor.white
        self.view.addSubview(date)
    }
    
    @objc func done() {
           date.endEditing(true)
           // 日付のフォーマット
           let formatter = DateFormatter()
           formatter.locale = Locale(identifier: "ja_JP")
           formatter.dateStyle = .long
           date.text = "\(formatter.string(from: datePicker.date))"
    }
    
    @objc func save() {
        self.errorMessage.text = ""
        // bodyのバリデーション
        if(body.text.count >= 300) {
            self.errorMessage.text = "300文字までしか入力できません"
            errorMessage.textColor = UIColor.red
        } else {
            let updatedDiary = realmDiary.update(date: date.text!, body: body.text, imitation: imitation.text, diary: diary!)
            let storyboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(identifier: "diaryDetail") as! DiaryDetailViewController
            nextView.diary = updatedDiary
            self.navigationController?.pushViewController(nextView, animated: true)
        }
    }
       
}
