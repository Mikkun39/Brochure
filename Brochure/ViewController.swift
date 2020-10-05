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
    
    //データの数を入れるための配列
    var detailList: Results<Detail>!
    
    //表紙のアイコンを入れるための配列
    var coverImageArray = [UIImage]()
    
    //選択中のアイコンを入れるための変数
    var selectedIcon: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collection.dataSource = self
        collection.delegate = self
        
        // レイアウト設定
        let layout = UICollectionViewFlowLayout()
        //セルのサイズ
        layout.itemSize = CGSize(width: 72, height: 120)
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
        
        detailList = realm.objects(Detail.self)
        
        collection.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        // 表示するセルを登録(先程命名した"Cell")
        cell.backgroundColor = .blue  // セルの色
        
        //cellのimageを変更
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = detailList[indexPath.row].coverImage
        // UIImageをUIImageViewのimageとして設定
       
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
            
        }
    }
}


