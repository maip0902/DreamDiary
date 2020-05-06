
import UIKit
import RealmSwift

class ViewController: UIViewController {
//    let user = User()
let user = RealmUserRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
    }
}

