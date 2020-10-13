//
//  DetailFirstTableViewCell.swift
//  Brochure
//
//  Created by 高山瑞基 on 2020/10/13.
//

import UIKit

class DetailFirstTableViewCell: UITableViewCell {
    
    @IBOutlet var detailTenjiLabel: UILabel!
    @IBOutlet var detailDateLabel: UILabel!
    @IBOutlet var detailWhereLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        detailDateLabel.adjustsFontSizeToFitWidth = true
        detailDateLabel.adjustsFontSizeToFitWidth = true
        detailWhereLabel.adjustsFontSizeToFitWidth = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
