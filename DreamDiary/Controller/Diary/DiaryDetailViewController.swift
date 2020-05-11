
import UIKit

class DiaryDetailViewController: UIViewController {

    var diary: Diary?
    
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        layout.setFooter(footer)
        dateLabel?.text = diary?.date
        // Do any additional setup after loading the view.
    }
}
