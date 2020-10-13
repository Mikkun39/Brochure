//
//  DetailSecondTableViewCell.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/13.
//

import UIKit

class DetailSecondTableViewCell: UITableViewCell {
    
    @IBOutlet var detailWorkImageView: UIImageView!
    @IBOutlet var detailWorkTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
