import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    let user = RealmUserRepository()
    var loginUser: User?
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var footer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Do any additional setup after loading the view.
    }
}
