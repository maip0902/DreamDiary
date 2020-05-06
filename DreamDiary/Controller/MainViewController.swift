import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    let user = RealmUserRepository()
    var loginUser: User?
    
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let firebaseUser = Auth.auth().currentUser {
            if let u = user.findByLoginId(loginId: firebaseUser.uid) {
                self.loginUser = u
                let displayName = u.name
                loginLabel.text = "\(displayName)さんのページ"
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toCreate(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toCreateDiary", sender: self.loginUser!)
    }
    
    @IBAction func showList(_ sender: Any) {
        self.performSegue(withIdentifier: "showList", sender: self.loginUser!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateDiary" {
            let next = segue.destination as! DiaryViewController
            next.loginUser = sender as! User
        }
        
        if segue.identifier == "showList" {
            let next = segue.destination as! DiaryTableTableViewController
            next.loginUser = sender as! User
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
