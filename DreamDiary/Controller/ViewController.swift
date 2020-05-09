
import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        // 位置
        layout.spaceBetween(create, login)
        // 丸角
        layout.setCorenerRadius(create)
        layout.setCorenerRadius(login)
        // 枠線
        layout.setBorderWidth(create)
        layout.setBorderWidth(login)
        layout.setBorderColor(create)
        layout.setBorderColor(login)
        
    }
}

