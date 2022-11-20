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
    var employeeSalary: Int? 
    
    
}


extension Employee: CustomStringConvertible {
    var description: String {
        switch  self.employeeTitle.rawValue {
        case 1:
            return "Junior"
        case 2:
            return "Mid"
        case 3:
            return "Senior"
        case 4:
            return "Architecture"
        case 5:
            return "Manager"
        
        default:
            return "Junior"
        }
    }
    
   
}
