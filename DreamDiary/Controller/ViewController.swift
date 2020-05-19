
import UIKit
import RealmSwift
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var login: UIButton!
    
    @objc fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        
        // 戻るボタンつけない
        self.navigationItem.hidesBackButton = true
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        // 位置
        layout.spaceBetweenHeight(uiContents: [create, login], space: 0.25, 0.2, 0.35, 0.6, 0.1)
        layout.setOutlet(create, radius: 0.1, borderWidth: 1, color: UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        layout.setOutlet(login, radius: 0.1, borderWidth: 1, color: UIColor(red: 255, green: 204, blue: 204, alpha: 1.0).cgColor)
        // logo
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        logoImage.frame = CGRect(x: screenWidth*0.17, y: screenHeight*0.1, width: screenWidth*0.75, height: screenHeight*0.2)
        self.view.addSubview(logoImage)
    }
}

