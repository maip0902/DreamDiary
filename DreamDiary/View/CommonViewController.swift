//
//  CommonViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/17.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import FirebaseAuth
class CommonViewController: UIViewController {

    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var logoutBarButton: UIBarButtonItem = UIBarButtonItem(title: "ログアウト", style: .done, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem = logoutBarButton
    }
    
    @objc func logout() {
        do {
            try Auth.auth().signOut()
            let storybord = self.storyboard!
            let nextView = storybord.instantiateViewController(identifier: "top") as! ViewController
            self.navigationController?.pushViewController(nextView, animated: true)
        } catch let signOutError as NSError {
            print(signOutError)
        }
        
    }
}
