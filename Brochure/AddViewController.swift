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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ImageViewのタップ認識をONにする
        coverImageView.isUserInteractionEnabled = true
        addWorkImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func addMemo() {
        
    }
    
    @IBAction func save() {
        
        // Realmを初期化
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let detail1 = Detail()
        let tenjiSet1 = tenjiSet()
        
        detail1.whereText = addWhereTextField.text!
        detail1.whenText = addDateTextField.text!
        detail1.whatTenjiText = addTenjiTextField.text!
        tenjiSet1.tenjiMemo = addWorkTextView.text!
            
        //STEP.3 Realmに書き込み
        try! realm.write {
         realm.add(tenjiSet1)
         realm.add(detail1)
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
        let image = info[.originalImage] as? UIImage
        
        //imageを表紙画像に設定
        coverImageView.image = image
        
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
        
        //imageを表紙画像に設定
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
