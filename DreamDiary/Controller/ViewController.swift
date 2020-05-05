//
//  ViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/04.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
//    let user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        print(realm.objects(User.self))
//        if let BaseView = Bundle.main.loadNibNamed("BaseView", owner: self, options: nil)?.first as? BaseView {
//            self.view.addSubview(BaseView)
//        }
        
//         Do any additional setup after loading the view.
//        print(user)
//        user.name = "test"
//        user.email = "test@test.com"
//        user.password = "testuser"
//        self.save()
    }
    
//    func save() {
//      do {
//        let realm = try Realm()  // Realmのインスタンスを作成します。
//        try realm.write {
//          realm.add(self.user)  // 作成した「realm」というインスタンスにrealmDataを書き込みます。
//        }
//      } catch {
//
//      }
//    }
}

