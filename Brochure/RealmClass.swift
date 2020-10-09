//
//  RealmClass.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/03.
//

import Foundation
import RealmSwift

class Detail: Object {
    //管理用のid
    @objc dynamic var detailId: Int = 0
    
    //表紙の写真
    @objc dynamic var coverImage: Data? = nil
    
    //場所のテキスト
    @objc dynamic var whereText: String = ""
    
    //日付のテキスト
    @objc dynamic var whenText: String = ""
    
    //展示名のテキスト
    @objc dynamic var whatTenjiText: String = ""
    
    //展示の写真とメモのセット
    let tenjiList = List<tenjiSet>()
    
    //全体のメモ
    @objc dynamic var memoText: String = ""

}

class tenjiSet: Object {
    //展示のリストの順番
    @objc dynamic var tenjiId: Int = 0
    
    //展示の写真
    @objc dynamic var tenjiImage: NSData? = nil
    
    //展示のメモ
    @objc dynamic var tenjiMemo: String = ""
    
   
}
