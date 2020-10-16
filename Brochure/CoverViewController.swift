//
//  CoverViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/16.
//

import UIKit

class CoverViewController: UIViewController {
    @IBOutlet var galleryButton: UIButton!
    @IBOutlet var toAddButton: UIButton!
    @IBOutlet var iconimageView: UIImageView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //角丸の程度を指定
        self.galleryButton.layer.cornerRadius = 10.0
        self.toAddButton.layer.cornerRadius = 10.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func toGallery () {
        
    }
    
    @IBAction func toAdd() {
        
    }
    
}
