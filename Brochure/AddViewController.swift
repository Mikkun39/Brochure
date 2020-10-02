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
    @IBOutlet var addMemoTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ImageViewのタップ認識をONにする
        coverImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func AddMemo() {
        
    }
    
    @IBAction func Save() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AddPhoto() {
        //UIImagePickerControllerのインスタンスを作る
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        //フォトライブラリを使う設定をする
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        //フォトライブラリを呼び出す
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //imageに選んだ画像を設定
        let image = info[.originalImage] as? UIImage
        
        //imageを表紙画像に設定
        coverImageView.image = image
        
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
