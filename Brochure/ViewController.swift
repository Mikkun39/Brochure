//
//  ViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet var collection: UICollectionView!
    
    @IBOutlet var coverImageView: UIImageView!
    
    @IBOutlet var tenjiTextLabel: UILabel!
    
//    @IBOutlet var deleteButton: UIButton!
    
    //データの数を入れるための配列
    var detailList: Results<Detail>!
   
    //表紙のアイコンを入れるための配列
    var coverImageArray = [UIImage]()
    
    //選択中のアイコンを入れるための変数
    var selectedIcon: Int = 0
    
    //選択中のアイコンを入れる変数2
    var tappedIcon: Int = 0
    
    //追加画面での判定に使うテキスト
    var addJudgeText: String = "ViewからAddへ"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collection.dataSource = self
        collection.delegate = self
        
        // レイアウト設定
        let layout = UICollectionViewFlowLayout()
        //セルのサイズ
        layout.itemSize = CGSize(width: 120, height: 180)
        //セル同士の間隔
        layout.minimumInteritemSpacing = 20
        //セル同士の行間
        layout.minimumLineSpacing = 48
        //セル全体の余白
        layout.sectionInset = UIEdgeInsets(top: 48, left: 50, bottom: 24, right: 50)
        collection.collectionViewLayout = layout

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //realmの呼び込む
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        detailList = realm.objects(Detail.self)

        
        //detailList = realm.objects(Detail.self)
    
        collection.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        // 表示するセルを登録(先程命名した"Cell")
        //cellのimageを変更
        // Tag番号を使ってImageViewのインスタンス生成
        coverImageView = cell.contentView.viewWithTag(1) as? UIImageView
        
        //tag番号を使ってLabelのインスタンス生成
        tenjiTextLabel = cell.contentView.viewWithTag(2) as? UILabel
        
//        //tag番号を使ってボタンのインスタンス生成
//        deleteButton = cell.contentView.viewWithTag(3) as? UIButton
//
//
//        //addtargetを追加
//        deleteButton?.addTarget(self, action: #selector(self.buttonEvent(_: )), for: UIControl.Event.touchUpInside)
//
//        deleteButton?.tag = indexPath.row
//
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = detailList[indexPath.row].coverImage
        // UIImageをUIImageViewのimageとして設定
        coverImageView.image = UIImage(data: cellImage! as Data)

        
        
        coverImageView.contentMode = .scaleToFill
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIcon = Int(indexPath.row)
        performSegue(withIdentifier: "toDetailViewController", sender: nil)

    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController" {
            let nextViewController = segue.destination as? DetailViewController
            nextViewController?.iconNumber = self.selectedIcon
        } else if segue.identifier == "toAdd" {
            let nextVC = segue.destination as? AddViewController
            nextVC?.judgeText = addJudgeText
        }
    }
    
    @IBAction func backToCover (){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToAdd () {
        self.performSegue(withIdentifier: "toAdd", sender: nil)
    }
    
//    @objc func buttonEvent(_ sender: UIButton) {
//        tappedIcon = deleteButton.tag
//        print(tappedIcon)
//        // (1)Realmインスタンスの生成
//        let realm = try! Realm()
//        // (2)クエリによるデータの取得
//        let viewResults = realm.objects(Detail.self).filter("detailId == \(tappedIcon)")
//        // (3)データの削除
//        try! realm.write {
//            realm.delete(viewResults)
//        }
//        detailList = realm.objects(Detail.self)
//        collection.reloadData()
//    }
//
//    //セルの削除許可を設定
//    func collectionView(_ tableView: UICollectionView,canEditItemAt indexPath: IndexPath) -> Bool{
//           return true
//    }
    
 
}


