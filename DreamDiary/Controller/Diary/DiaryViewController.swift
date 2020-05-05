//
//  DiaryViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/05.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import RealmSwift

class DiaryViewController: UIViewController {

    
    
    @IBOutlet weak var body: UITextView!
    
    @IBOutlet weak var imitation: UITextView!
    
    @IBOutlet weak var date: UITextField!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    var diary = RealmDiaryRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        date.inputView = datePicker
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        date.inputView = datePicker
        date.inputAccessoryView = toolbar
        
        // Do any additional setup after loading the view.
    }
    
    @objc func done() {
        date.endEditing(true)

        // 日付のフォーマット
        let formatter = DateFormatter()

        //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
        formatter.dateFormat = "yyyy年MM月dd日"

        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        date.text = "\(formatter.string(from: datePicker.date))"

    }
    
    @IBAction func create(_ sender: Any) {
        let realm = try! Realm()
        let user = realm.objects(User.self).filter("userId = '3F96844E-2096-401F-98B7-3CA01E457C18'")[0]
        print(user.diaries)
        let body = self.body.text ?? ""
        let imitation = self.imitation.text ?? ""
        let date = self.date.text ?? ""
        
        let createdDiary = diary.create(date: date, body: body, imitation: imitation, user: user)
        print(createdDiary)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
