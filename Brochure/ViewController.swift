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
    
    //表紙のアイコンを入れるための配列
    var coverImageArray = [UIImage]()

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
        collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        // 表示するセルを登録(先程命名した"Cell")
        cell.backgroundColor = .blue  // セルの色
        return cell
    }


}

