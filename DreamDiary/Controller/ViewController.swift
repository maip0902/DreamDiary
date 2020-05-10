
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
        layout.setCorenerRadius(create, 0.1)
        layout.setCorenerRadius(login, 0.1)
        // 枠線
        layout.setBorderWidth(create, 1)
        layout.setBorderWidth(login, 1)
        layout.setBorderColor(create, UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        layout.setBorderColor(login, UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        
        // logo
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        logoImage.frame = CGRect(x: screenWidth*0.17, y: screenHeight*0.1, width: screenWidth*0.75, height: screenHeight*0.2)
        self.view.addSubview(logoImage)
    }
}

