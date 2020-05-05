//
//  LoginViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/04.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    var user: User?
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.isSecureTextEntry = true
        if let u = user {
            email.text = u.name
            password.text = u.password
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let email = self.email.text ?? ""
        let password = self.password.text ?? ""
        
        // ログイン処理
        let creds = SyncCredentials.usernamePassword(username: email, password: password)
        SyncUser.logIn(with: creds, server: Constants.AUTH_URL, onCompletion: { [weak self](user, err) in
            if let _ = user {
                print(SyncUser.current!)
                self?.performSegue(withIdentifier: "showMain", sender: nil)
                
            } else if let error = err {
                fatalError(error.localizedDescription)
            }
            
        })
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
