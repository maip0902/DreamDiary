
import UIKit

class DiaryDetailViewController: UIViewController {

    var diary: Diary?
    
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel?.text = diary?.date
        // Do any additional setup after loading the view.
    }
}
