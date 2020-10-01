//
//  DetailViewController.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/01.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var whereLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var tenjiLabel: UILabel!
    
    @IBOutlet var workImageView: UIImageView!
    @IBOutlet var workLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Edit() {
        
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
