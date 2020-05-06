
import UIKit
import RealmSwift
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let email = self.email.text ?? ""
        let password = self.password.text ?? ""
        
        // ログイン処理
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          // [START_EXCLUDE]
            if let error = error {
              return
            }
            self?.performSegue(withIdentifier: "showMain", sender: nil)
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
