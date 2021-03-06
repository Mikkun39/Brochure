//
//  AddThirdTableViewCell.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/10.
//

import UIKit

class AddThirdTableViewCell: UITableViewCell, UITextViewDelegate{
    
    @IBOutlet var addMemoTextView: UITextView!
    @IBOutlet var memoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addMemoTextView.delegate = self
        addMemoTextView.layer.cornerRadius = 15
        addMemoTextView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
