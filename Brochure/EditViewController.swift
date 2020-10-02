//
//  EditViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    @IBOutlet var whereTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var tenjiTextField: UITextField!
    
    @IBOutlet var EditImageView: UIImageView!
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet var commentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Save() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func AddMemoList() {
        
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
