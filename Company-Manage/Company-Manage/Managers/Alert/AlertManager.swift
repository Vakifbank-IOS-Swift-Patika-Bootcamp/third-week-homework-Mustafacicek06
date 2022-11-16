//
//  AlertManager.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 17.11.2022.
//

import UIKit





protocol AlertShowable {
    func showAlert(with error: AlertError)
}


final class AlertManager: AlertShowable {
    static let shared: AlertManager = .init()
    
    func showAlert(with error: AlertError)  {
        let alert = UIAlertController(title: "Opps!!", message: error.description, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        DispatchQueue.main.async {
            UIApplication.
        }
    }
}


