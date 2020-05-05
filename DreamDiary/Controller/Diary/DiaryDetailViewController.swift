//
//  DiaryDetailViewController.swift
//  DreamDiary
//
//  Created by 神田舞 on 2020/05/05.
//  Copyright © 2020 神田舞. All rights reserved.
//

import UIKit

class DiaryDetailViewController: UIViewController {

    var diary: Diary?
    
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel?.text = diary?.date
        // Do any additional setup after loading the view.
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
