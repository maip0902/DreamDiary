
import UIKit
import RealmSwift

class DiaryDetailViewController: CommonViewController {

    var diary: Diary?
    
    @IBOutlet weak var footer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let editButton = UIButton()
        editButton.setTitle("編集", for: UIControl.State.normal)
        layout.setPositionByRatio(0.2, 0.7, 0.4, 0.1, uiContent: editButton)
        layout.setOutlet(editButton, radius: 0.5, borderWidth: 2, color: UIColor.white.cgColor)
        editButton.addTarget(self, action: #selector(edit), for: UIControl.Event.touchUpInside)
        self.view.addSubview(editButton)
    }
    
    @objc func edit() {
        let storybord = self.storyboard
        let nextView = storybord?.instantiateViewController(identifier: "editDiary") as! DiaryEditViewController
        nextView.diary = diary
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
