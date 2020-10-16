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
        
        detailTenjiLabel.layer.cornerRadius = 12
        detailTenjiLabel.clipsToBounds = true
        
        detailDateLabel.layer.cornerRadius = 6
        detailDateLabel.clipsToBounds = true
        
        detailWhereLabel.layer.cornerRadius = 8
        detailWhereLabel.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
