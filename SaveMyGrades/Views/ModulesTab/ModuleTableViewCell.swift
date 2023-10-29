//
//  ModuleTableViewCell.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 02/09/2021.
//

import UIKit

class ModuleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backgroundShape: UIView!
    @IBOutlet weak var moduleIdentifier: UILabel!
    @IBOutlet weak var backgroundShapeHeight: NSLayoutConstraint!
    @IBOutlet weak var moduleGrade: UILabel!
    @IBOutlet weak var moduleIcon: UIImageView!
    @IBOutlet weak var userMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundShape.layer.cornerRadius = 20
        backgroundShape.alpha = 0.3
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            UIView.animate(withDuration: 0.5) {
                self.backgroundShape.alpha = 1
            }
            UIView.animate(withDuration: 0.5) {
                self.backgroundShape.alpha = 0.3
            }
            DispatchQueue.main.async {
//                print("Set constraint")
//                self.testt.constant = 100
////                self.backgroundShapeHeight.constant = 100
                
            }
            
//        backgroundShape.alpha = 1
//        backgroundShape.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        // Configure the view for the selected state
        }
    }
    
    
    
    
}
