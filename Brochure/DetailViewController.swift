//
//  DetailViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet var table: UITableView!
    @IBOutlet var whereLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var tenjiLabel: UILabel!
    
    @IBOutlet var workImageView: UIImageView!
    @IBOutlet var workLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!

    
    // realmから呼び出すための変数を用意する
    var editWhereText: String?
    var editDateText: String?
    var editTenjiText: String?
    var editMemoText: [String]?
    var editCommentText: String?
    
    //選択されてきたアイコンの番号を確認するための変数
    var iconNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self
        
        table.estimatedRowHeight = 66
        table.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        //realmから値を呼び出して反映
        let realm = try! Realm()
        
        let detailResults = realm.objects(Detail.self).filter("detailId == \(iconNumber)").first
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell")
        
        // Tag番号を使ってImageViewのインスタンス生成
        workImageView = cell!.contentView.viewWithTag(1) as? UIImageView
        
        workLabel = cell!.contentView.viewWithTag(2) as? UILabel
        
        let rColor: CGFloat = CGFloat(indexPath.row / 10)
    
        cell?.contentView.backgroundColor = UIColor(red: rColor , green:1.0 , blue:1.0 , alpha: 1.0)
        
        return cell!
        
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
            nextVC?.detailNumber = self.iconNumber
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
