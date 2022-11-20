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
        employeeTableView.delegate = self
        employeeTableView.dataSource = self
    }
    


}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employee?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = employee?[indexPath.row].employeeName
        
        
        content.secondaryText = String("Salary : \(employee?[indexPath.row].employeeSalary ?? 0)")
        
        
        
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    
}




