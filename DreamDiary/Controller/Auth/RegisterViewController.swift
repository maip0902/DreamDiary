//
//  RegisterViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/04.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var user = RealmUserRepository()
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 入力非表示モード
        password.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func register(_ sender: Any) {
        let name: String = self.userName.text ?? ""
        let email: String = self.email.text ?? ""
        let password: String = self.password.text ?? ""
        
        let createdUser = user.create(name: name, email: email, password: password)
        
        self.performSegue(withIdentifier: "loginAfterRegister", sender: createdUser)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginAfterRegister" {
            let next = segue.destination as! LoginViewController
            next.user = sender as! User
        }
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
