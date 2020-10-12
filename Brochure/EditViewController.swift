//
//  EditViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var whereTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var tenjiTextField: UITextField!
    
    @IBOutlet var editImageView: UIImageView!
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet var commentTextView: UITextView!
    @IBOutlet var editTable: UITableView!
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var whereText: String?
    var dateText: String?
    var tenjiText: String?
    var memoText: [String]?
    var commentText: String?
    
    //選択されてきたアイコンの番号を確認するための変数
    var detailNumber: Int = 0
    
    //セルの数を管理するための変数
    var cellCount: Int = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        editTable.delegate = self
        editTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //realmから値を呼び出して反映
        let realm = try! Realm()
        
        let detailResults = realm.objects(Detail.self).filter("detailId == \(detailNumber)").first
    
        if detailResults != nil {
            whereText = detailResults?.whereText
            dateText = detailResults?.whenText
            tenjiText = detailResults?.whatTenjiText
            commentText = detailResults?.memoText
            
            whereTextField.text = whereText
            dateTextField.text = dateText
            tenjiTextField.text = tenjiText
            commentTextView.text = commentText
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditViewCell")
        
        // Tag番号を使ってImageViewのインスタンス生成
        editImageView = cell!.contentView.viewWithTag(1) as? UIImageView
        
        memoTextView = cell!.contentView.viewWithTag(2) as? UITextView
        
        editImageView.isUserInteractionEnabled = true
        
        return cell!
    }
    
    
    @IBAction func save() {
        // Realmを初期化
        let realm = try! Realm()
        
        let detailResults = realm.objects(Detail.self).filter("detailId == \(detailNumber)").first
        
        //STEP.3 Realmに書き込み
        try! realm.write {
            detailResults?.whereText = whereTextField.text!
            detailResults?.whenText = dateTextField.text!
            detailResults?.whatTenjiText = tenjiTextField.text!
            detailResults?.memoText = commentTextView.text!
            detailResults?.setValue(commentTextView.text, forKey: "memoText")
        }

        
        self.navigationController?.popViewController(animated: true)
    }

    //@IBAction func addMemoList() {
      //  cellCount += 1
        //editTable.reloadData()
    //}
    
//    //スワイプしたセルを削除
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            cellCount -= 1
//            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//            editTable.reloadData()
//        }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


