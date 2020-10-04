//
//  EditViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    @IBOutlet var whereTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var tenjiTextField: UITextField!
    
    @IBOutlet var EditImageView: UIImageView!
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet var commentTextView: UITextView!
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var whereText: String?
    var dateText: String?
    var tenjiText: String?
    var memoText: [String]?
    var commentText: String?
    
    //選択されてきたアイコンの番号を確認するための変数
    var detailNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        whereTextField.text = whereText
        dateTextField.text = dateText
        tenjiTextField.text = tenjiText
        commentTextView.text = commentText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        // Realmを初期化
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
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

    @IBAction func addMemoList() {
    
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
