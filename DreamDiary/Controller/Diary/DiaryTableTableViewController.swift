
import UIKit
import RealmSwift
class DiaryTableTableViewController: UITableViewController {

    var loginUser : User?
    let db = DBConnect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let layout = CustomLayout(screenWidth, screenHeight)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let u = self.loginUser {
            let diaries = u.diaries
            
            return diaries.count
        } else {
            
            return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let u = self.loginUser {
            let diary = u.diaries[indexPath.row]
            cell.textLabel?.text = diary.date
            cell.textLabel?.textColor = UIColor(red: 255/255.0, green: 128/255.0, blue: 134/255.0, alpha: 1.0)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
            cell.backgroundColor = UIColor(red: 255/255.0, green: 214/255.0, blue: 218/255.0, alpha: 1.0)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let u = self.loginUser {
            let diary = u.diaries[indexPath.row]
            self.performSegue(withIdentifier: "showDetail", sender: diary)
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let next = segue.destination as! DiaryDetailViewController
            next.diary = sender as! Diary
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if let u = self.loginUser {
                let diaries = u.diaries
                let diary = diaries[indexPath.row]
                let realm = self.db.connect()
                
                try! realm.write {
                    diaries.remove(at: indexPath.row)
                }
                self.db.delete(diary)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
    }
}
