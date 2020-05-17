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
    var datePicker: UIDatePicker = UIDatePicker()
    
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
        self.view.addSubview(dateLabel)
        self.view.addSubview(bodyLabel)
        self.view.addSubview(imitationLabel)
        
        let body = UITextView()
        let imitation = UITextView()
        body.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.3, width:screenWidth*0.5, height:screenHeight*0.15)
        imitation.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.5, width:screenWidth*0.5, height:screenHeight*0.1)
        
        self.view.addSubview(body)
        self.view.addSubview(imitation)
        
        if let diaryItem = diary {
            body.text = diaryItem.body
            imitation.text = diaryItem.imitation
        }
        
        let saveButton = UIButton()
        saveButton.setTitle("保存", for: UIControl.State.normal)
        layout.centeringWidth(saveButton, 0.7, 0.5, 0.1)
        layout.setOutlet(saveButton, radius: 0.1, borderWidth: 2, color: UIColor(red: 255, green: 128, blue: 134, alpha: 1.0).cgColor)
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
        // Do any additional setup after loading the view.
    }
    
    @objc func done() {
           date.endEditing(true)
           // 日付のフォーマット
           let formatter = DateFormatter()
           formatter.locale = Locale(identifier: "ja_JP")
           formatter.dateStyle = .long
           date.text = "\(formatter.string(from: datePicker.date))"

    }
       
}
