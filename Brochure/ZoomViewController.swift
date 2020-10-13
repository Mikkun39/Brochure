//
//  ZoomViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/13.
//

import UIKit

class ZoomViewController: UIViewController{
    
    @IBOutlet var zoomImageView: UIImageView!
    
    //segueで持ってくるようの変数
    var zoomImage: UIImage!
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.black
        zoomImageView.backgroundColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        zoomImageView.image = zoomImage
    }
    @IBAction func back (){
        dismiss(animated: true, completion: nil)
    }
    
}
