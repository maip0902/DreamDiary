
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.isSecureTextEntry = true
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        
        layout.setFormLabel(emailLabel, passwordLabel)
        layout.setInputField(email, password)
        layout.centeringWidth(forgetoasswordlabel,screenHeight*0.6,screenWidth*0.5,screenHeight*0.1)
        layout.centeringWidth(login, screenHeight*0.55,screenWidth*0.5,screenHeight*0.05)
        layout.setCorenerRadius(login, 0.1)
        layout.setBorderWidth(login, 1)
        layout.setBorderColor(login, UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let email = self.email.text ?? ""
        let password = self.password.text ?? ""
        
        // ログイン処理
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            let errorMessage = UILabel()
          // [START_EXCLUDE]
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    switch(errorCode) {
                        case .wrongPassword:
                            errorMessage.text = "パスワードが間違っています"
                        default :
                            errorMessage.text = "ログインできません"
                    }
                }
            }
            self?.performSegue(withIdentifier: "showMain", sender: nil)
        }
          // [END_EXCLUDE]
    }
    
    @IBAction func showPasswordReset(_ sender: Any) {
        self.performSegue(withIdentifier: "toPasswordReset", sender: nil)
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
