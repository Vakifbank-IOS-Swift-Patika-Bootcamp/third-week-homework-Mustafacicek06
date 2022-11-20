//
//  EmployeeListViewController.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 17.11.2022.
//

import UIKit

final class EmployeeListViewController: UIViewController {
    var employee: [Employee]?
    
    @IBOutlet private weak var employeeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Employee List"
    }
    


}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employee?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = employee[indexPath.row].employeeName
        
        content.secondaryText = employee[indexPath.row].employeeTitle
        
        
        return cell
    }
    
    
    
}




