import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    let user = RealmUserRepository()
    
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firebaseUser = Auth.auth().currentUser {
            if let u = user.findByLoginId(loginId: firebaseUser.uid) {
                print(u)
                let displayName = u.name
                loginLabel.text = "\(displayName)さんのページ"
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toCreate(_ sender: Any) {
        self.performSegue(withIdentifier: "toCreateDiary", sender: nil)
    }
    
    @IBAction func showList(_ sender: Any) {
        self.performSegue(withIdentifier: "showList", sender: nil)
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
