//
//  HeaderTableViewCell.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 03/09/2021.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
