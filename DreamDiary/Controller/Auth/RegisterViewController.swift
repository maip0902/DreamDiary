
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
    
    let errorMessage = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        layout.spaceBetweenHeight(uiContents: [userName, email, password], space: 0.2, 0.35, 0.2, 0.5, 0.05)
        layout.spaceBetweenHeightLabel(uiContents: [userNameLabel, emailLabel, passwordLabel], space: 0.2, 0.1, 0.2, 0.5, 0.05)
        layout.centeringWidth(register, 0.6, 0.5, 0.05)
        layout.setOutlet(register, radius: 0.1, borderWidth: 2, color: UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        // パスワードフィールド入力非表示モード
        password.isSecureTextEntry = true
        // Do any additional setup after loading the view.
        errorMessage.text = ""
        layout.setLabelPositionByRatio(0.05, 0.5, 0.9, 0.1, uiContent: errorMessage)
        errorMessage.textColor = UIColor.red
        self.view.addSubview(errorMessage)
    }
    
    
    @IBAction func register(_ sender: Any) {
        self.errorMessage.text = ""
        self.view.addSubview(self.errorMessage)
        let name: String = self.userName.text ?? ""
        let email: String = self.email.text ?? ""
        let password: String = self.password.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            let screenWidth = UIScreen.main.bounds.size.width
            let screenHeight = UIScreen.main.bounds.size.height
            
            // バリデーション後でちゃんと書く
            if email == "" || password == "" {
                self.errorMessage.text = "入力情報に不足があります"
                self.view.addSubview(self.errorMessage)
                return
            }
          // [START_EXCLUDE]
            guard let newUser = authResult?.user, error == nil else {
                
                if let code = AuthErrorCode(rawValue: (error! as NSError).code) {
                    // エラーメッセージ生成
                    switch(code) {
                        case .emailAlreadyInUse:
                            self.errorMessage.text = "すでに使用されているアドレスです"
                        case .invalidEmail:
                            self.errorMessage.text = "メールアドレスを正しく入力してください"
                        case .weakPassword:
                            self.errorMessage.text = "パスワードが短すぎます"
                        default :
                            self.errorMessage.text = "登録に失敗しました"
                    }
                    self.view.addSubview(self.errorMessage)
                }
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
