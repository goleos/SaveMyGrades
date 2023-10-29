//
//  TaskCell.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 15/09/2021.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskInfo: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 25
        self.selectionStyle = .none
        // Initialization code
    }
    
    func populateWithData(_ task: Task, isAction: Bool = false) {
        self.icon.image = TaskIcon(for: task).image
        self.taskName.text = task.name
        taskInfo.text = chooseTaskInfo(task: task, isAction: isAction)
        guard let task = task as? Assessment else {
            return
        }
        self.gradeLabel.isHidden = false
        guard let grade = task.grade else {
            self.gradeLabel.text = "Not graded"
            return
        }
        self.gradeLabel.text = grade.value
        if grade < UserData.shared.gradeTarget! {
            self.gradeLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        } else {
            self.gradeLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }
    
    func chooseTaskInfo(task: Task, isAction: Bool) -> String {
        var result = task.status.displayTitle
        guard !isAction else {
            return task.deadline?.description ?? "Deadline not set"
        }
        return result
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            UIView.animate(withDuration: 0.5, animations: {self.containerView.alpha = 1})
            UIView.animate(withDuration: 0.5, animations: {self.containerView.alpha = 0.3})
        }
        // Configure the view for the selected state
    }
}
