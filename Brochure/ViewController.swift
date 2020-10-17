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
    
    //データの数を入れるための配列
    var detailList: Results<Detail>!
   
    //表紙のアイコンを入れるための配列
    var coverImageArray = [UIImage]()
    
    //選択中のアイコンを入れるための変数
    var selectedIcon: Int = 0
    
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
        layout.itemSize = CGSize(width: 100, height: 140)
        //セル同士の間隔
        layout.minimumInteritemSpacing = 12
        //セル同士の行間
        layout.minimumLineSpacing = 48
        //セル全体の余白
        layout.sectionInset = UIEdgeInsets(top: 48, left: 60, bottom: 24, right: 60)
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
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = detailList[indexPath.row].coverImage
        // UIImageをUIImageViewのimageとして設定
        coverImageView.image = UIImage(data: cellImage! as Data)
        
        coverImageView.contentMode = .scaleToFill
        
        //配列の番号で指定された要素の名前をテキストとして表示
        let cellText = detailList[indexPath.row].whatTenjiText
        //テキストをラベルに代入
        tenjiTextLabel.text = cellText
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIcon = Int(indexPath.row)
        print(selectedIcon)
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
}


