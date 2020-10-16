//
//  DetailViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate{

    
    @IBOutlet var table: UITableView!
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
    
    //セルの番号ごとにimageを管理
    var cellNumImage0: UIImage!
    var cellNumImage1: UIImage!
    var cellNumImage2: UIImage!
    var cellNumImage3: UIImage!
    var cellNumImage4: UIImage!
    
    //セルの番号とStringを管理
    var cellNumString0: String!
    var cellNumString1: String!
    var cellNumString2: String!
    var cellNumString3: String!
    var cellNumString4: String!
    
    //addviewに渡す文字列
    var toAddViewText: String = "DetailViewからAddViewへ"
    
    //選択されてきたアイコンの番号を確認するための変数
    var iconNumber: Int = 0
    
    //カスタムセルのインスタンス化
    var firstCell = DetailFirstTableViewCell()
    var secondCell = DetailSecondTableViewCell()
    var thirdCell = DetailThirdTableViewCell()
    
    //押されたセルの番号を確認
    var detailSelectedCellNumber: Int = 0
    
    //画像をタップするための設定(addImage用)
    let detailImageTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(detailImage(recognizer:)))
    
    //選ばれた写真を確認
    var selectedImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.delegate = self
        
        //作ったカスタムセルを登録する
        table.register(UINib(nibName: "DetailFirstTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailFirstTableViewCell")
        
        table.register(UINib(nibName: "DetailSecondTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailSecondTableViewCell")
        
        table.register(UINib(nibName: "DetailThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailThirdTableViewCell")
        
        table.allowsSelection = false
        
        detailImageTapGesture.delegate = self
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
    
        }
        
        table.reloadData()
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 5
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        firstCell = tableView.dequeueReusableCell(withIdentifier: "DetailFirstTableViewCell")! as! DetailFirstTableViewCell
        
        secondCell = tableView.dequeueReusableCell(withIdentifier: "DetailSecondTableViewCell")! as! DetailSecondTableViewCell
        
        thirdCell = tableView.dequeueReusableCell(withIdentifier: "DetailThirdTableViewCell")! as! DetailThirdTableViewCell
        
        if indexPath.section == 0 {
            firstCell.detailTenjiLabel.text = detailTenjiText
            firstCell.detailDateLabel.text = detailDateText
            firstCell.detailWhereLabel.text = detailWhereText
            
            //セルの高さを変更
            table.rowHeight = 200
            return firstCell
            
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                secondCell.detailWorkTextView.text = detailWorkText0
                secondCell.detailWorkImageView.image = detailWorkImage0
            } else if indexPath.row == 1 {
                secondCell.detailWorkTextView.text = detailWorkText1
                secondCell.detailWorkImageView.image = detailWorkImage1
            } else if indexPath.row == 2 {
                secondCell.detailWorkTextView.text = detailWorkText2
                secondCell.detailWorkImageView.image = detailWorkImage2
            } else if indexPath.row == 3 {
                secondCell.detailWorkTextView.text = detailWorkText3
                secondCell.detailWorkImageView.image = detailWorkImage3
            } else if indexPath.row == 4 {
                secondCell.detailWorkTextView.text = detailWorkText4
                secondCell.detailWorkImageView.image = detailWorkImage4
            }
            //imageを押した時にアクションが呼び出せるように
            secondCell.detailWorkImageView.isUserInteractionEnabled = true
            secondCell.detailWorkImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(detailImage(recognizer:))))
            //セルの高さを変更
            table.rowHeight = 180
            return secondCell
            
        } else {
            //セルの高さを変更
            table.rowHeight = 180
        
            thirdCell.detailMemoTextView.text = detailCommentText
            return thirdCell
        }
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
        } else if segue.identifier == "toZoom" {
            let nextViewController = segue.destination as? ZoomViewController
            nextViewController?.zoomImage = self.selectedImage!
        }
    }
    
    @objc func detailImage(recognizer: UITapGestureRecognizer) {
        //押された位置をcellのpathを取得
        let point = recognizer.location(in: table)
        let indexPath = table.indexPathForRow(at: point)
        detailSelectedCellNumber = (indexPath?[1])!
        
        if detailSelectedCellNumber == 0 {
            selectedImage = detailWorkImage0
        } else if detailSelectedCellNumber == 1 {
            selectedImage = detailWorkImage1
        } else if detailSelectedCellNumber == 2 {
            selectedImage = detailWorkImage2
        } else if detailSelectedCellNumber == 3 {
            selectedImage = detailWorkImage3
        } else if detailSelectedCellNumber == 4 {
            selectedImage = detailWorkImage4
        }
       
        self.performSegue(withIdentifier: "toZoom", sender: nil)
    
    }
    
    @IBAction func back () {
        self.navigationController?.popViewController(animated: true)
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
