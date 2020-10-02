//
//  AddViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var addDateTextField: UITextField!
    @IBOutlet var addWhereTextField: UITextField!
    @IBOutlet var addTenjiTextField: UITextField!
    @IBOutlet var addWorkImageView: UIImageView!
    @IBOutlet var addMemoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddMemo() {
        
    }
    
    @IBAction func Save() {
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
