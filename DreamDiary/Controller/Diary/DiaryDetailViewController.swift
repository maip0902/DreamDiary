
import UIKit

class DiaryDetailViewController: UIViewController {

    var diary: Diary?
    
    @IBOutlet weak var footer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
        layout.setFooter(footer)
        
        let dateLabel = UILabel()
        dateLabel.text = diary?.date
        dateLabel.textAlignment = NSTextAlignment.center
        layout.setLabelPositionByRatio(0.2, 0.1, 0.6, 0.1, uiContent: dateLabel)
        dateLabel.textColor = UIColor(red: 255/255.0, green: 128/255.0, blue: 134/255.0, alpha: 1.0)
        self.view.addSubview(dateLabel)
        
        let body = UILabel()
        body.text = diary?.body
        layout.setLabelPositionByRatio(0.2, 0.2, 0.6, 0.3, uiContent: body)
        body.numberOfLines = 0
        body.textColor = UIColor(red: 255/255.0, green: 128/255.0, blue: 134/255.0, alpha: 1.0)
        self.view.addSubview(body)
    }
}
