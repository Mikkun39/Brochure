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
    //let tenjiList = List<tenjiSet>()
    
    //全体のメモ
    @objc dynamic var memoText: String = ""
    
    //ひとつ目の写真
    @objc dynamic var tenjiImage0: Data? = nil
    
    //二つ目の写真
    @objc dynamic var tenjiImage1: Data? = nil
    
    //三つ目の写真
    @objc dynamic var tenjiImage2: Data? = nil
    
    //四つ目の写真
    @objc dynamic var tenjiImage3: Data? = nil
    
    //五つ目の写真
    @objc dynamic var tenjiImage4: Data? = nil
    
    //一つ目の文章
    @objc dynamic var tenjiMemo0: String = ""
    
    //二つ目の文章
    @objc dynamic var tenjiMemo1: String = ""
    
    //三つ目の文章
    @objc dynamic var tenjiMemo2: String = ""
    
    //四つ目の文章
    @objc dynamic var tenjiMemo3: String = ""
    
    //五つ目の文章
    @objc dynamic var tenjiMemo4: String = ""

}

//class tenjiSet: Object {
//    //展示のリストの順番
//    @objc dynamic var tenjiId: Int = 0
//
//    //展示の写真
//    @objc dynamic var tenjiImage: Data? = nil
//
//    //展示のメモ
//    @objc dynamic var tenjiMemo: String = ""
//
//
//}
