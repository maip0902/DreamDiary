
import UIKit
import RealmSwift
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var forgetoasswordlabel: UIButton!
    
    @IBOutlet weak var login: UIButton!
    
    let errorMessage = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.isSecureTextEntry = true
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        
        layout.setFormLabel(emailLabel, passwordLabel)
        layout.setInputField(email, password)
        layout.centeringWidth(forgetoasswordlabel, 0.6, 0.5, 0.1)
        layout.centeringWidth(login, 0.55, 0.5, 0.05)
        layout.setCorenerRadius(login, 0.1)
        layout.setBorderWidth(login, 1)
        layout.setBorderColor(login, UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        
        // Do any additional setup after loading the view.
        errorMessage.text = ""
        errorMessage.frame = CGRect(x: screenWidth*0.05, y: screenHeight*0.45, width:screenWidth*0.9, height:screenHeight*0.1)
        errorMessage.textColor = UIColor.red
        self.view.addSubview(errorMessage)
    }
    
    @IBAction func login(_ sender: Any) {
        self.errorMessage.text = ""
        self.view.addSubview(errorMessage)
        let email = self.email.text ?? ""
        let password = self.password.text ?? ""
        
        // ログイン処理
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          // [START_EXCLUDE]
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    switch(errorCode) {
                        case .wrongPassword:
                            self?.errorMessage.text = "パスワードが間違っています"
                        default :
                            self?.errorMessage.text = "ログインできません"
                    }
                }
                self?.view.addSubview(self?.errorMessage as! UILabel)
                return
            }
            self?.performSegue(withIdentifier: "showMain", sender: nil)
        }
          // [END_EXCLUDE]
    }
    
    @IBAction func showPasswordReset(_ sender: Any) {
        self.performSegue(withIdentifier: "toPasswordReset", sender: nil)
    }
}
