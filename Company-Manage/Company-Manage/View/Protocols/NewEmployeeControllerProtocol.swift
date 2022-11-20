//
//  NewEmployeeControllerProtocol.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 20.11.2022.
//

import Foundation


protocol NewEmployeeControllerDelegate : AnyObject {
    func didAssignedAttributes(_ employees: [Employee])
}
