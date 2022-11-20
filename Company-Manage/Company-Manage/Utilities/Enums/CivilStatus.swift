//
//  CivilStatus.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 19.11.2022.
//

import Foundation

enum CivilStatus: String {
    case married, single
    
}

extension CivilStatus {
    var rawValue: String  {
       switch self {
         case CivilStatus.married:
           return "Married";
         case CivilStatus.single:
           return "Single";
       }
     }
}
