//
//  passwordResetViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/07.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit
import FirebaseAuth

class passwordResetViewController: UIViewController {

    @IBOutlet weak var emailAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(_ sender: Any) {
        if let email = emailAddress {
            let verifyEmailAddress = email.text
            Auth.auth().sendPasswordReset(withEmail: verifyEmailAddress!) { error in
                if error != nil {
                    return
                }
            }
        }
    }
}
