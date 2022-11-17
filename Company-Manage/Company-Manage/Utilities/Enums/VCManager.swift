//
//  VCManager.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 17.11.2022.
//

import Foundation


enum VCManager {
    case toNewEmployeePage
    case toEmployeeListPage
}


extension VCManager {
    public var rawValue: String {
        switch self {
        case .toNewEmployeePage:
            return "toNewEmployee"
        case .toEmployeeListPage:
            return "toEmployeeList"
        }
    }
}
