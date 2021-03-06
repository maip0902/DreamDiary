
import UIKit
import RealmSwift

class DiaryViewController: CommonViewController {

    @IBOutlet weak var body: UITextView!
    
    @IBOutlet weak var imitation: UITextView!
    
    @IBOutlet weak var date: UITextField!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var imitationLabel: UILabel!
    
    @IBOutlet weak var createButton: UIButton!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    var realmDiary = RealmDiaryRepository()
    
    var loginUser: User?
    
    let errorMessage = UILabel()
    
    @IBOutlet weak var footer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = CustomLayout(screenWidth, screenHeight)
        layout.setFooter(footer)
        
        layout.spaceBetweenHeightLabel(uiContents: [dateLabel, bodyLabel], space: 0.2, 0.1, 0.2, 0.5, 0.05)
        layout.setLabelPositionByRatio(0.1, 0.5, 0.3, 0.05, uiContent: imitationLabel)
        
        body.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.3, width:screenWidth*0.5, height:screenHeight*0.15)
        imitation.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.5, width:screenWidth*0.5, height:screenHeight*0.1)
        
        layout.centeringWidth(createButton, 0.7, 0.5, 0.1)
        layout.setOutlet(createButton, radius: 0.1, borderWidth: 2, color: UIColor(red: 255, green: 128, blue: 134, alpha: 1.0).cgColor)
        
        layout.setLabelPositionByRatio(0.1, 0.6, 0.8, 0.1, uiContent: errorMessage)
        self.view.addSubview(errorMessage)
        // datePicker
        datePicker.datePickerMode = UIDatePicker.Mode.date
        date.inputView = datePicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        date.inputView = datePicker
        date.inputAccessoryView = toolbar
        date.frame = CGRect(x: screenWidth*0.35, y:screenHeight*0.2, width:screenWidth*0.5, height:screenHeight*0.05)
        // Do any additional setup after loading the view.
    }
    
    @objc func done() {
        date.endEditing(true)

        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = .long

        date.text = "\(formatter.string(from: datePicker.date))"

    }
    
    @IBAction func create(_ sender: Any) {
        self.errorMessage.text = ""
        let body = self.body.text ?? ""
        let imitation = self.imitation.text ?? ""
        let date = self.date.text ?? ""
        
        if let u = self.loginUser {
            // bodyのバリデーション
            if(self.body.text.count >= 200) {
                self.errorMessage.text = "200文字までしか入力できません"
                errorMessage.textColor = UIColor.red
            } else {
                let createdDiary = realmDiary.create(date: date, body: body, imitation: imitation, user: u)
                let storybord = self.storyboard!
                let nextView = storybord.instantiateViewController(identifier: "diaryDetail") as! DiaryDetailViewController
                nextView.diary = createdDiary
                self.navigationController?.pushViewController(nextView, animated: true)
            }
            
        }
        
    }
}
