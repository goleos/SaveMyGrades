//
//  ModuleSummaryViewController.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 02/09/2021.
//

import UIKit

class ModuleSummaryViewController: UIViewController {
    
    var module: Module?
    
    let tableViewSections = ["Grade Summary", "Assessment Structure"]
    
    var sampleAssessments = [
        Assessment(identifier: "CW1"),
        Assessment(identifier: "CW2"),
        Assessment(identifier: "CW3"),
        Assessment(identifier: "CW4"),
        Assessment(identifier: "CW5"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = module?.identifier
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ModuleTableViewCell", bundle: nil), forCellReuseIdentifier: "ModuleTableViewCell")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        // Do any additional setup after loading the view.
    }
    
}

extension ModuleSummaryViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Grade Summary"
        } else {
            return "Assessment Structure"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return sampleAssessments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = "Wrong Type"
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
                cell.textLabel?.text = "Average"
            } else {
                cell =  tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
                cell.textLabel?.text = "Predicted"
            }
            return cell
        } else {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "ModuleTableViewCell", for: indexPath) as! ModuleTableViewCell
            myCell.moduleIdentifier.text = sampleAssessments[indexPath.row].identifier
            return myCell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
        headerCell.title.text = tableViewSections[section]
        headerCell.translatesAutoresizingMaskIntoConstraints = false
        return headerCell
    }
    
    
}

extension ModuleSummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
