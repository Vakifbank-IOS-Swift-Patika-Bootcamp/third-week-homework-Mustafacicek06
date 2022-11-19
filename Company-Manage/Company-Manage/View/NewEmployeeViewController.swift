//
//  NewEmployeeViewController.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 17.11.2022.
//

import UIKit

final class NewEmployeeViewController: UIViewController {
    // MARK: Components
    @IBOutlet private weak var nameTextField: UITextField!
    
    @IBOutlet private weak var titleTextField: UITextField!
    
    @IBOutlet private weak var ageTextField: UITextField!
    
    @IBOutlet private weak var civilStatusTextField: UITextField!
    var pickerView = UIPickerView()
    
    // MARK: Variables
    
    var employee: [Employee]?

    
    let employeeTitles = ["Junior", "Mid","Senior","Architecture","Manager", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New Employee"
        pickerView.delegate = self
        pickerView.dataSource = self
        
        nameTextField.text = employee?.count.description ?? "0"
        
        
        
        titleTextField.inputView = pickerView
    }
    


}

extension NewEmployeeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        EmployeeTitle.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        employeeTitles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleTextField.text = employeeTitles[row]
        titleTextField.resignFirstResponder()
    }
    
}
