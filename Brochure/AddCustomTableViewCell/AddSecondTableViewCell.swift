//
//  AddSecondTableViewCell.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/10.
//

import UIKit

class AddSecondTableViewCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet var addWorkImageView: UIImageView!
    @IBOutlet var addWorkTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addWorkTextView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
