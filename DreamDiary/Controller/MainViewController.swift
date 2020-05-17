import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    let user = RealmUserRepository()
    var loginUser: User?
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var footer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ログイン後画面には戻るつけない
        self.navigationItem.hidesBackButton = true
        var logoutBarButton: UIBarButtonItem = UIBarButtonItem(title: "ログアウト", style: .done, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem = logoutBarButton
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        layout.setFooter(footer)
        
        if let firebaseUser = Auth.auth().currentUser {
            if let u = user.findByLoginId(loginId: firebaseUser.uid) {
                self.loginUser = u
                let displayName = u.name
                loginLabel.text = "\(displayName)さんのページ"
                loginLabel.textAlignment = NSTextAlignment.center
                layout.setLabelPositionByRatio(0.2, 0.1, 0.6, 0.1, uiContent: loginLabel)
                loginLabel.textColor = UIColor(red: 255/255.0, green: 128/255.0, blue: 134/255.0, alpha: 1.0)
            }
        }
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
