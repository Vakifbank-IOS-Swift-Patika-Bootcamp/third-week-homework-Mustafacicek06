//
//  Employee.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 18.11.2022.
//

import Foundation


struct Employee {
    var employeeName: String
    var employeeTitle: EmployeeTitle
    var employeeAge: Int
    var civilStatus: CivilStatus
    var employeeSalary: Int? {
        didSet {
            self.employeeSalary = employeeAge * employeeTitle.rawValue * 500
        }
    }
    
    
}
