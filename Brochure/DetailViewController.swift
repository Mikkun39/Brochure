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
    @IBOutlet var workTextView: UITextView!
    @IBOutlet var commentLabel: UILabel!

    
    // realmから呼び出すための変数を用意する
    var detailCoverImage: UIImage?
    var detailWhereText: String?
    var detailDateText: String?
    var detailTenjiText: String?
    var detailCommentText: String?
    var detailWorkImage0: UIImage?
    var detailWorkImage1: UIImage?
    var detailWorkImage2: UIImage?
    var detailWorkImage3: UIImage?
    var detailWorkImage4: UIImage?
    var detailWorkText0: String?
    var detailWorkText1: String?
    var detailWorkText2: String?
    var detailWorkText3: String?
    var detailWorkText4: String?
    
    //addviewに渡す文字列
    var toAddViewText: String = "DetailViewからAddViewへ"
    
    //選択されてきたアイコンの番号を確認するための変数
    var iconNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self
        
        table.estimatedRowHeight = 66
        table.rowHeight = UITableView.automaticDimension
        
        //labelの文字数に応じてテキストサイズの変更
        whereLabel.adjustsFontSizeToFitWidth = true
        dateLabel.adjustsFontSizeToFitWidth = true
        tenjiLabel.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        //realmから値を呼び出して反映
        let realm = try! Realm()
        
        let detailResults = realm.objects(Detail.self).filter("detailId == \(iconNumber)").first
    
        if detailResults != nil {
            detailWhereText = detailResults?.whereText
            detailDateText = detailResults?.whenText
            detailTenjiText = detailResults?.whatTenjiText
            detailCommentText = detailResults?.memoText
            detailCoverImage = UIImage(data: (detailResults?.coverImage)!)
            detailWorkImage0 = UIImage(data: (detailResults?.tenjiImage0)!)
            detailWorkImage1 = UIImage(data: (detailResults?.tenjiImage1)!)
            detailWorkImage2 = UIImage(data: (detailResults?.tenjiImage2)!)
            detailWorkImage3 = UIImage(data: (detailResults?.tenjiImage3)!)
            detailWorkImage4 = UIImage(data: (detailResults?.tenjiImage4)!)
            detailWorkText0 = detailResults?.tenjiMemo0
            detailWorkText1 = detailResults?.tenjiMemo1
            detailWorkText2 = detailResults?.tenjiMemo2
            detailWorkText3 = detailResults?.tenjiMemo3
            detailWorkText4 = detailResults?.tenjiMemo4
    
            
            
            whereLabel.text = detailWhereText
            dateLabel.text = detailDateText
            tenjiLabel.text = detailTenjiText
            commentLabel.text = detailCommentText
        }
        
        table.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell")
        
        // Tag番号を使ってImageViewのインスタンス生成
        workImageView = cell!.contentView.viewWithTag(1) as? UIImageView
        
        workTextView = cell!.contentView.viewWithTag(2) as? UITextView
        
        if indexPath.row == 0 {
            workTextView.text = detailWorkText0
            workImageView.image = detailWorkImage0
        } else if indexPath.row == 1 {
            workTextView.text = detailWorkText1
            workImageView.image = detailWorkImage1
        } else if indexPath.row == 2 {
            workTextView.text = detailWorkText2
            workImageView.image = detailWorkImage2
        } else if indexPath.row == 3 {
            workTextView.text = detailWorkText3
            workImageView.image = detailWorkImage3
        } else if indexPath.row == 4 {
            workTextView.text = detailWorkText4
            workImageView.image = detailWorkImage4
        }
        
        return cell!
        
    }
    
    
    
    @IBAction func edit() {
        self.performSegue(withIdentifier: "AddViewController", sender: nil)
            //self.performSegue(withIdentifier: "EditViewController", sender: nil)
            
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddViewController" {
            let nextVC = segue.destination as? AddViewController
            nextVC?.whereText = self.detailWhereText ?? ""
            nextVC?.dateText = self.detailDateText ?? ""
            nextVC?.tenjiText = self.detailTenjiText ?? ""
            nextVC?.memoText = self.detailCommentText ?? ""
            nextVC?.coverImage = self.detailCoverImage!
            nextVC?.cellNumString0 = self.detailWorkText0 ?? ""
            nextVC?.cellNumString1 = self.detailWorkText1 ?? ""
            nextVC?.cellNumString2 = self.detailWorkText2 ?? ""
            nextVC?.cellNumString3 = self.detailWorkText3 ?? ""
            nextVC?.cellNumString4 = self.detailWorkText4 ?? ""
            nextVC?.cellNumImage0 = self.detailWorkImage0!
            nextVC?.cellNumImage1 = self.detailWorkImage1!
            nextVC?.cellNumImage2 = self.detailWorkImage2!
            nextVC?.cellNumImage3 = self.detailWorkImage3!
            nextVC?.cellNumImage4 = self.detailWorkImage4!
            nextVC?.judgeText = self.toAddViewText
            nextVC?.detailToEditNumber = self.iconNumber
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
