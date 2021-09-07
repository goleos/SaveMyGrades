//
//  ModulesViewController.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 01/09/2021.
//

import UIKit

class ModulesViewController: UIViewController {
    
    @IBOutlet weak var modulesTableView: UITableView!
    @IBOutlet weak var modulesTabBarItem: UITabBarItem!
    
    var sampleModules = [
        Module(identifier: "MATH317"),
        Module(identifier: "MATH318"),
        Module(identifier: "MATH319"),
        Module(identifier: "MATH327"),
        Module(identifier: "MATH336"),
        Module(identifier: "MATH331"),
        Module(identifier: "MATH330"),
        Module(identifier: "MATH361"),
    ]
    
    var currentModuleSelected: Module?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modulesTableView.dataSource = self
        modulesTableView.delegate = self
        modulesTableView.register(UINib(nibName: "ModuleTableViewCell", bundle: nil), forCellReuseIdentifier: "ModuleTableViewCell")

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToModuleSummary" {
            let destinationVC = segue.destination as! ModuleSummaryViewController
            destinationVC.module = currentModuleSelected!
        }
    }
    
}

extension ModulesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleModules.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = modulesTableView.dequeueReusableCell(withIdentifier: "ModuleTableViewCell", for: indexPath) as! ModuleTableViewCell
        cell.moduleIdentifier.text = sampleModules[indexPath.row].identifier
        return cell
    }


}

extension ModulesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentModuleSelected = sampleModules[indexPath.row]
        self.performSegue(withIdentifier: "goToModuleSummary", sender: self)
    }

}
