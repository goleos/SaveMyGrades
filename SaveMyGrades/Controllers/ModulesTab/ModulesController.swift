//
//  ModulesController.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 15/09/2021.
//

import UIKit

class ModulesController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PeriodSelector", bundle: nil), forCellReuseIdentifier: "PeriodSelector")
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ModulesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserData.shared.session!.modules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        let modules = UserData.shared.session!.modules
        cell.populateWithData(modules[indexPath.row], isAction: true)
        return cell
    }
    
    
}

extension ModulesController: UITableViewDelegate {
    
}
