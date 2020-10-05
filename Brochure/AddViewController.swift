//
//  AddViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var addDateTextField: UITextField!
    @IBOutlet var addWhereTextField: UITextField!
    @IBOutlet var addTenjiTextField: UITextField!
    @IBOutlet var addWorkImageView: UIImageView!
    @IBOutlet var addWorkTextView: UITextView!
    @IBOutlet var addMemoTextView: UITextView!
    
    //UIImageを保存する
    var coverImage: UIImage!
    
    //各データのUIIMageを保存
    var addImage = [UIImage]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ImageViewのタップ認識をONにする
        coverImageView.isUserInteractionEnabled = true
        addWorkImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func addMemo() {
        let addImageView = UIImageView.init(frame: CGRect.init(x: self.addWorkImageView.frame.origin.x, y: self.addWorkImageView.frame.origin.y + 100, width: self.addWorkImageView.frame.width, height: self.addWorkImageView.frame.height))
        addImageView.image = UIImage(named: "unnamed")
        self.view.addSubview(addImageView)
        
    }
    
    @IBAction func save() {
        
        let data = NSData(data: coverImage.pngData()!)
        
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
        detail.coverImage = data
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
        
        //imageに選んだ画像を設定
        coverImage = info[.originalImage] as? UIImage
        
        //imageを表紙画像に設定
        coverImageView.image = coverImage
        
        //フォトライブラリを閉じる
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func addWorkImage(_ sender: Any) {
        
        //UIImagePickerControllerのインスタンスを作る
        let addWorkImagePickerController: UIImagePickerController = UIImagePickerController()
        
        //フォトライブラリを使う設定をする
        addWorkImagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        addWorkImagePickerController.delegate = self
        addWorkImagePickerController.allowsEditing = true
        
        //フォトライブラリを呼び出す
        self.present(addWorkImagePickerController, animated: true, completion: nil)
        
    }
    
    //作品の写真にフォトライブラリから写真を参照する
    func addWorkImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //imageに選んだ画像を設定
        let addImage = info[.originalImage] as? UIImage
        
        //imageを画像に設定
        addWorkImageView.image = addImage
        
        //フォトライブラリを閉じる
        self.dismiss(animated: true, completion: nil)
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
