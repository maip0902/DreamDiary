//
//  FooterViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/10.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import FirebaseAuth
class FooterViewController: UIViewController {

    let user = RealmUserRepository()
    var loginUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        
        // ボタン生成
        let listButton = UIButton(type: UIButton.ButtonType.system)
        let createButton = UIButton(type: UIButton.ButtonType.system)
        // ラベル
        listButton.setTitle("一覧", for: .normal)
        createButton.setTitle("新規作成", for: .normal)
        // 位置
        layout.setPositionByRatio(0.25, 0.01, 0.25, 0.1, uiContent: listButton)
        layout.setPositionByRatio(0.5, 0.01, 0.25, 0.1, uiContent: createButton)
        
        listButton.setTitleColor(UIColor(red: 255/255.0, green: 128/255.0, blue: 134/255.0, alpha: 1.0), for: .normal)
        createButton.setTitleColor(UIColor(red: 255/255.0, green: 128/255.0, blue: 134/255.0, alpha: 1.0), for: .normal)
        

        self.view.addSubview(listButton)
        self.view.addSubview(createButton)
        
        listButton.addTarget(self, action: #selector(list(_:)), for: UIControl.Event.touchUpInside)
        createButton.addTarget(self, action: #selector(create(_:)), for: UIControl.Event.touchUpInside)
        if let firebaseUser = Auth.auth().currentUser {
            if let u = user.findByLoginId(loginId: firebaseUser.uid) {
                self.loginUser = u
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func list(_ sender: Any) {
        let storybord: UIStoryboard = self.storyboard!
        let nextView = storyboard?.instantiateViewController(withIdentifier: "list") as! DiaryTableTableViewController
        nextView.loginUser = loginUser!
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    @objc func create(_ sender: Any) {
        let storybord: UIStoryboard = self.storyboard!
        let nextView = storyboard?.instantiateViewController(identifier: "create") as! DiaryViewController
        nextView.loginUser = self.loginUser!
        self.navigationController?.pushViewController(nextView, animated: true)
    }

}
