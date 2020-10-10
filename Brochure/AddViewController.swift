//
//  AddViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var addDateTextField: UITextField!
    @IBOutlet var addWhereTextField: UITextField!
    @IBOutlet var addTenjiTextField: UITextField!
    @IBOutlet var addWorkImageView: UIImageView!
    @IBOutlet var addWorkTextView: UITextView!
    @IBOutlet var addMemoTextView: UITextView!
    @IBOutlet var addTable: UITableView!
    
    //UIImageを保存する
    var coverImage: UIImage!
    
    //各データのUIIMageを保存
    var addImage: UIImage!

    //セルの数を保存
    var cellCount: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addTable.delegate = self
        addTable.dataSource = self
        
        //ImageViewのタップ認識をONにする
        coverImageView.isUserInteractionEnabled = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddViewCell")
        
        // Tag番号を使ってImageViewのインスタンス生成
        addWorkImageView = cell!.contentView.viewWithTag(1) as? UIImageView
        
        addWorkTextView = cell!.contentView.viewWithTag(2) as? UITextView
        
        addWorkImageView.isUserInteractionEnabled = true
        return cell!
    }
    
    
    
    @IBAction func addMemo() {
        //let addImageView = UIImageView.init(frame: CGRect.init(x: self.addWorkImageView.frame.origin.x, y: self.addWorkImageView.frame.origin.y + 100, width: self.addWorkImageView.frame.width, height: self.addWorkImageView.frame.height))
        //addImageView.image = UIImage(named: "unnamed")
        //self.view.addSubview(addImageView)
        
        cellCount += 1
        
        addTable.reloadData()
        
    }
    
    @IBAction func save() {
        
        // Realmを初期化
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let detail = Detail()
        let tenji = tenjiSet()
        
        // IDに値を設定。タスクのidに1を足して他のIDと重ならない値に
        if realm.objects(Detail.self).count != 0 {
               detail.detailId = realm.objects(Detail.self).max(ofProperty: "detailId")! + 1
        }
        
        detail.whereText = addWhereTextField.text!
        detail.whenText = addDateTextField.text!
        detail.whatTenjiText = addTenjiTextField.text!
        detail.memoText = addMemoTextView.text!
        detail.coverImage = Data(coverImage.pngData()!)
        tenji.tenjiImage = Data(addImage.pngData()!)
        tenji.tenjiMemo = addWorkTextView.text!
        
        
            
        //STEP.3 Realmに書き込み
        try! realm.write {
         realm.add(tenji)
         realm.add(detail)
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapCoverImage(_ sender: Any) {
        
        //UIImagePickerControllerのインスタンスを作る
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        //フォトライブラリを使う設定をする
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        //フォトライブラリを呼び出す
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    //表紙画像にフォトライブラリから写真を参照する
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if picker.title != "addWorkImage"{
            //imageに選んだ画像を設定
            coverImage = info[.originalImage] as? UIImage
            
            //imageを表紙画像に設定
            coverImageView.image = coverImage
            
            //フォトライブラリを閉じる
            self.dismiss(animated: true, completion: nil)
        } else {
            //imageに選んだ画像を設定
            addImage = info[.originalImage] as? UIImage
            
            //imageを画像に設定
            addWorkImageView.image = addImage
            
            //フォトライブラリを閉じる
            self.dismiss(animated: true, completion: nil)
        }
    }
    

    @IBAction func addWorkImage(_ sender: Any) {
        
        //UIImagePickerControllerのインスタンスを作る
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        //フォトライブラリを使う設定をする
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.title = "addWorkImage"
        
        //フォトライブラリを呼び出す
        self.present(imagePickerController, animated: true, completion: nil)
        
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
