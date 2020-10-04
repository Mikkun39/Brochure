//
//  DetailViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet var whereLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var tenjiLabel: UILabel!
    
    @IBOutlet var workImageView: UIImageView!
    @IBOutlet var workLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    // 遷移先から戻したい渡したい値を格納する変数を用意する
    var editWhereText: String?
    var editDateText: String?
    var editTenjiText: String?
    var editMemoText: [String]?
    var editCommentText: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //realmから値を呼び出して反映
        let realm = try! Realm()
        
        let detailResults = realm.objects(Detail.self).filter("whereText == '浅草'").first
    
        if detailResults != nil {
            editWhereText = detailResults?.whereText
            editDateText = detailResults?.whenText
            editTenjiText = detailResults?.whatTenjiText
            editCommentText = detailResults?.memoText
            
            whereLabel.text = editWhereText
            dateLabel.text = editDateText
            tenjiLabel.text = editTenjiText
            commentLabel.text = editCommentText
        }
        
        
    }
    
    @IBAction func edit() {
       
            self.performSegue(withIdentifier: "EditViewController", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditViewController" {
            let nextVC = segue.destination as? EditViewController
            nextVC?.whereText = self.whereLabel.text
            nextVC?.dateText = self.dateLabel.text
            nextVC?.tenjiText = self.tenjiLabel.text
            nextVC?.commentText = self.commentLabel.text
        }
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
