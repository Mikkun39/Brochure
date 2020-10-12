//
//  AddViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate,UITextFieldDelegate, UITextViewDelegate{
    
    @IBOutlet var addTable: UITableView!
    
    //カスタムセルのインスタンス化
    var firstCell = AddFirstTableViewCell()
    var secondCell = AddSecondTableViewCell()
    var thirdCell = AddThirdTableViewCell()
    
    //テキストたちを保存
    var dateText: String = ""
    var whereText: String = ""
    var tenjiText: String = ""
    var workText: String = ""
    var memoText: String = ""
    
    //detailviewからのsegueからなのかを判定する
    var judgeText: String = ""
    
    //UIImageを保存する
    var coverImage: UIImage = UIImage.init(systemName: "camera")!
    
    //各データのUIIMageを保存
    var addImageDic =  [UIImage]()
    
    //セルの数を保存
    var cellCount: Int = 1
    
    //画像をタップするための設定(coverImage用)
    let coverImageTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapCoverImage(recognizer:)))
    //画像をタップするための設定(addImage用)
    let addImageTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addWorkImage(recognizer:)))
    
    //テキストをタップするための設定
    let addTextTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedTextView(recognizer:)))
    
    //セルの番号ごとにimageを管理
    var cellNumImage0: UIImage = UIImage.init(systemName: "camera")!
    var cellNumImage1: UIImage = UIImage.init(systemName: "camera")!
    var cellNumImage2: UIImage = UIImage.init(systemName: "camera")!
    var cellNumImage3: UIImage = UIImage.init(systemName: "camera")!
    var cellNumImage4: UIImage = UIImage.init(systemName: "camera")!
    
    //セルの番号とStringを管理
    var cellNumString0: String = ""
    var cellNumString1: String = ""
    var cellNumString2: String = ""
    var cellNumString3: String = ""
    var cellNumString4: String = ""
    
    //選択されたてきたアイコンの番号を確認するための変数
    var detailToEditNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        addTable.delegate = self
        addTable.dataSource = self
        
        coverImageTapGesture.delegate = self
        addImageTapGesture.delegate = self
        addTextTapGesture.delegate = self
        
        //ImageViewのタップ認識をONにする
        //coverImageView.isUserInteractionEnabled = true
        
        //作ったカスタムセルを登録する
        addTable.register(UINib(nibName: "AddFirstTableViewCell", bundle: nil), forCellReuseIdentifier: "AddFirstTableViewCell")
        
        addTable.register(UINib(nibName: "AddSecondTableViewCell", bundle: nil), forCellReuseIdentifier: "AddSecondTableViewCell")
        
        addTable.register(UINib(nibName: "AddThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "AddThirdTableViewCell")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セル選択されている")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "AddViewCell")
        
        // Tag番号を使ってImageViewのインスタンス生成
        //addWorkImageView = cell!.contentView.viewWithTag(1) as? UIImageView
        
        //addWorkTextView = cell!.contentView.viewWithTag(2) as? UITextView
        
        //addWorkImageView.isUserInteractionEnabled = true
        firstCell = tableView.dequeueReusableCell(withIdentifier: "AddFirstTableViewCell")! as! AddFirstTableViewCell
        
        secondCell = tableView.dequeueReusableCell(withIdentifier: "AddSecondTableViewCell")! as! AddSecondTableViewCell
        
        thirdCell = tableView.dequeueReusableCell(withIdentifier: "AddThirdTableViewCell")! as! AddThirdTableViewCell
        
        if indexPath.section == 0 {
            firstCell.coverImageView.image = coverImage
            //imageを押した時にアクションが呼び出せるように
            firstCell.coverImageView.isUserInteractionEnabled = true
            firstCell.coverImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCoverImage(recognizer:))))
            
            firstCell.addDateTextField.delegate = self
            firstCell.addWhereTextField.delegate = self
            firstCell.addTenjiTextField.delegate = self
            
            firstCell.addWhereTextField.tag = 1
            firstCell.addDateTextField.tag = 2
            firstCell.addTenjiTextField.tag = 3
            
            //テキストの内容を反映させる
            firstCell.addWhereTextField.text = whereText
            firstCell.addDateTextField.text = dateText
            firstCell.addTenjiTextField.text = tenjiText
            
            //セルの高さを変更
            addTable.rowHeight = 240
            return firstCell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                secondCell.addWorkImageView.image = cellNumImage0
                secondCell.addWorkTextView.text = cellNumString0
            } else if indexPath.row == 1 {
                secondCell.addWorkImageView.image = cellNumImage1
                secondCell.addWorkTextView.text = cellNumString1
            } else if indexPath.row == 2 {
                secondCell.addWorkImageView.image = cellNumImage2
                secondCell.addWorkTextView.text = cellNumString2
            } else if indexPath.row == 3 {
                secondCell.addWorkImageView.image = cellNumImage3
                secondCell.addWorkTextView.text = cellNumString3
            } else if indexPath.row == 4 {
                secondCell.addWorkImageView.image = cellNumImage4
                secondCell.addWorkTextView.text = cellNumString4
            }
            //imageを押した時にアクションが呼び出せるように
            secondCell.addWorkImageView.isUserInteractionEnabled = true
            secondCell.addWorkImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addWorkImage(recognizer:))))
            
            secondCell.addWorkTextView.tag = 100 + indexPath.row
            
            //テキストを呼び出した時にアクションを起こす
            secondCell.addWorkTextView.isUserInteractionEnabled = true
            secondCell.addWorkTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedTextView(recognizer:))))
            
            secondCell.addWorkTextView.delegate = self
            
            //セルの高さを変更
            addTable.rowHeight = 180
            return secondCell
        } else {
            
            //セルの高さを変更
            addTable.rowHeight = 500
        
            thirdCell.addMemoTextView.delegate = self
            thirdCell.addMemoTextView.tag = 200
            thirdCell.addMemoTextView.text = memoText
            
            //メモが書いてあるときはlabelを非表示にする
            if memoText.count != 0 {
                thirdCell.memoLabel.isHidden = true
            }
            
            return thirdCell
        }
        //return cell!
    }
    
    
    //メモの数を追加する(時間に余裕があれば)
    //@objc func addMemo() {
        //let addImageView = UIImageView.init(frame: CGRect.init(x: self.addWorkImageView.frame.origin.x, y: self.addWorkImageView.frame.origin.y + 100, width: self.addWorkImageView.frame.width, height: self.addWorkImageView.frame.height))
        //addImageView.image = UIImage(named: "unnamed")
        //self.view.addSubview(addImageView)
    
      //  cellNumImageDic[cellNumImageDic.count] = UIImage.init(systemName: "camera")!
        //cellNumStringDic[cellNumStringDic.count] = ""
        
        //addTable.reloadData()
        
    //}
    
    @IBAction func save() {
        if judgeText == "" {
            // Realmを初期化
            let realm = try! Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            
            let detail = Detail()
            
            // IDに値を設定。タスクのidに1を足して他のIDと重ならない値に
            if realm.objects(Detail.self).count != 0 {
                detail.detailId = realm.objects(Detail.self).max(ofProperty: "detailId")! + 1
            }
            
            
            detail.whereText = whereText
            detail.whenText = dateText
            detail.whatTenjiText = tenjiText
            detail.memoText = memoText
            detail.coverImage = Data(coverImage.jpegData(compressionQuality: 0.9)!)
            detail.tenjiImage0 = Data(cellNumImage0.jpegData(compressionQuality: 0.9)!)
            detail.tenjiImage1 = Data(cellNumImage1.jpegData(compressionQuality: 0.9)!)
            detail.tenjiImage2 = Data(cellNumImage2.jpegData(compressionQuality: 0.9)!)
            detail.tenjiImage3 = Data(cellNumImage3.jpegData(compressionQuality: 0.9)!)
            detail.tenjiImage4 = Data(cellNumImage4.jpegData(compressionQuality: 0.9)!)
            detail.tenjiMemo0 = cellNumString0
            detail.tenjiMemo1 = cellNumString1
            detail.tenjiMemo2 = cellNumString2
            detail.tenjiMemo3 = cellNumString3
            detail.tenjiMemo4 = cellNumString4
            
            
            //STEP.3 Realmに書き込み
            try! realm.write {
                realm.add(detail)
            }

            self.navigationController?.popViewController(animated: true)
            }
        
        if judgeText == "DetailViewからAddViewへ"{
                // Realmを初期化
                let realm = try! Realm()
                
                let detailResults = realm.objects(Detail.self).filter("detailId == \(detailToEditNumber)").first
                
                //STEP.3 Realmに書き込み
                try! realm.write {
                    detailResults?.coverImage = Data(coverImage.jpegData(compressionQuality: 0.9)!)
                    detailResults?.whereText = whereText
                    detailResults?.whenText = dateText
                    detailResults?.whatTenjiText = tenjiText
                    detailResults?.memoText = memoText
                    detailResults?.tenjiImage0 = Data(cellNumImage0.jpegData(compressionQuality: 0.9)!)
                    detailResults?.tenjiImage1 = Data(cellNumImage1.jpegData(compressionQuality: 0.9)!)
                    detailResults?.tenjiImage2 = Data(cellNumImage2.jpegData(compressionQuality: 0.9)!)
                    detailResults?.tenjiImage3 = Data(cellNumImage3.jpegData(compressionQuality: 0.9)!)
                    detailResults?.tenjiImage4 = Data(cellNumImage4.jpegData(compressionQuality: 0.9)!)
                    detailResults?.tenjiMemo0 = cellNumString0
                    detailResults?.tenjiMemo1 = cellNumString1
                    detailResults?.tenjiMemo2 = cellNumString2
                    detailResults?.tenjiMemo3 = cellNumString3
                    detailResults?.tenjiMemo4 = cellNumString4
                }
            self.navigationController?.popViewController(animated: true)
        }
    }
        
        //表紙の画像を選択する処理
        @objc func tapCoverImage(recognizer: UITapGestureRecognizer) {
            
            //UIImagePickerControllerのインスタンスを作る
            let imagePickerController: UIImagePickerController = UIImagePickerController()
            
            //フォトライブラリを使う設定をする
            imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            
            //フォトライブラリを呼び出す
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        //一度coverImageを格納する変数
    var selectedCoverImage: UIImage!
        //表紙画像にフォトライブラリから写真を参照する
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if picker.title != "addWorkImage"{
                //imageに選んだ画像を設定
                selectedCoverImage = info[.originalImage] as? UIImage
                coverImage =  selectedCoverImage
                
                addTable.reloadData()
                
                //フォトライブラリを閉じる
                self.dismiss(animated: true, completion: nil)
            } else {
                //imageに選んだ画像を設定
                var addImage: UIImage!
                
                addImage = info[.originalImage] as? UIImage
                
                //cellNumImageDic[selectedCellNumber + 1] = addImage
                
                if selectedCellNumber == 0{
                    cellNumImage0 = addImage
                } else if selectedCellNumber == 1 {
                    cellNumImage1 = addImage
                } else if selectedCellNumber == 2 {
                    cellNumImage2 = addImage
                } else if selectedCellNumber == 3 {
                    cellNumImage3 = addImage
                } else if selectedCellNumber == 4 {
                    cellNumImage4 = addImage
                }
                
                addTable.reloadData()
                //フォトライブラリを閉じる
                self.dismiss(animated: true, completion: nil)
            }
    }
    
    //押されたcellの番号
    var selectedCellNumber: Int = 0
    
    
    @objc func addWorkImage(recognizer: UITapGestureRecognizer) {
        //押された位置をcellのpathを取得
        let point = recognizer.location(in: addTable)
        let indexPath = addTable.indexPathForRow(at: point)
        selectedCellNumber = (indexPath?[1])!
        
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
    
    //textfieldが編集されるたびに呼ばれる
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("呼ばれた")
        if textField.tag == 1 {
            whereText = textField.text!
        } else if textField.tag == 2 {
            dateText = textField.text!
        } else if textField.tag == 3{
            tenjiText = textField.text!
            print(tenjiText)
        }
    }
    
    //textviewが編集されるたびに呼ばれる
    func textViewDidChange(_ textView: UITextView) {
        print("テキスト")
        if textView.tag == 100 {
            cellNumString0 = textView.text!
        } else if textView.tag == 101 {
            cellNumString1 = textView.text!
        } else if textView.tag == 102 {
            cellNumString2 = textView.text!
        } else if textView.tag == 103 {
            cellNumString3 = textView.text!
        } else if textView.tag == 104 {
            cellNumString4 = textView.text!
        }else if textView.tag == 200 {
            memoText = textView.text!
            //メモが書いてあるときはlabelを非表示にする
            if memoText.count != 0 {
                thirdCell.memoLabel.isHidden = true
            }
        }
        
    }
    
    //キーボード以外を触ることで、キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //リターンを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //リターンを閉じる
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    //押されたテキストの位置を把握
    var selectedTextNumber: Int = 0
    
    @objc func tappedTextView(recognizer: UITapGestureRecognizer){
        //押された位置をcellのpathを取得
        let tapPoint = recognizer.location(in: addTable)
        let tapIndexPath = addTable.indexPathForRow(at: tapPoint)
        selectedTextNumber = (tapIndexPath?[1])!
        print(selectedTextNumber)
        
    }
    //スワイプされたセル番号を取得
    var swipedNumber: Int = 0
    
    /*
    //スワイプしたセルを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        swipedNumber = indexPath.row 
        //cellNumImageDic.removeValue(forKey: swipedNumber)
        //cellNumStringDic.removeValue(forKey: swipedNumber)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        addTable.reloadData()
    }
     */
    
   
        //addworkTextViewの完了ボタン処理
        func textViewDoneHandle() {
            //textViewの入力完了後の完了ボタン設定
            // ツールバー生成
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
            // スタイルを設定
            toolBar.barStyle = UIBarStyle.default
            // 画面幅に合わせてサイズを変更
            toolBar.sizeToFit()
            // 閉じるボタンを右に配置するためのスペース?
            let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
            // 閉じるボタン
            let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped))
            // スペース、閉じるボタンを右側に配置
            toolBar.items = [spacer, commitButton]
            // textViewのキーボードにツールバーを設定
            secondCell.addWorkTextView.inputAccessoryView = toolBar
            thirdCell.addMemoTextView.inputAccessoryView = toolBar
        }
    
    @objc func commitButtonTapped() {
        self.secondCell.addWorkTextView.endEditing(true)
        self.thirdCell.addMemoTextView.endEditing(true)
    }
    
   
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return UITableView.automaticDimension
//        }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
