//
//  AddFirstTableViewCell.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/10.
//

import UIKit

class AddFirstTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var addDateTextField: UITextField!
    @IBOutlet var addWhereTextField: UITextField!
    @IBOutlet var addTenjiTextField: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addDateTextField.delegate = self
        addWhereTextField.delegate = self
        addTenjiTextField.delegate = self
        coverImageView.image = UIImage.init(named: "unnamed")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
