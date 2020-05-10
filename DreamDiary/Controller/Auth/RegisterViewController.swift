
import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    var user = RealmUserRepository()
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var register: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        layout.setThreeFormLabel(userNameLabel, emailLabel, passwordLabel)
        layout.setThreeInputField(userName, email, password)
        layout.centeringWidth(register, screenHeight*0.6, screenWidth*0.5, screenHeight*0.05)
        layout.setCorenerRadius(register, 0.1)
        layout.setBorderWidth(register, 2)
        layout.setBorderColor(register, UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        // パスワードフィールド入力非表示モード
        password.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func register(_ sender: Any) {
        let name: String = self.userName.text ?? ""
        let email: String = self.email.text ?? ""
        let password: String = self.password.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // バリデーション後でちゃんと書く
            if email == "" || password == "" {
                return
            }
          // [START_EXCLUDE]
            guard let newUser = authResult?.user, error == nil else {
                // TODO::エラーメッセージ表示
              return
            }
            let createdUser = self.user.create(loginId: newUser.uid, name: name)
            self.performSegue(withIdentifier: "loginAfterRegister", sender: nil)
          }
          // [END_EXCLUDE]
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
