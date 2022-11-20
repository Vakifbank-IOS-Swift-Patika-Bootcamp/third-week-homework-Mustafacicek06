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
    private var pickerView = UIPickerView()
    
    weak var delegate: NewEmployeeControllerDelegate?

    
    // MARK: Variables
    
    var employee: [Employee]?

    
    
    private let employeeTitles = ["Junior", "Mid","Senior","Architecture","Manager"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New Employee"
    
        configurePickerView()
       
        
    }
    
    private func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        titleTextField.inputView = pickerView
        
    }
   
    @IBAction func saveButtonClicked(_ sender: Any) {
        guard (nameTextField.text != nil), nameTextField.text != "" else {
            AlertManager.shared.showAlert(with: .emptyInput)
            return
        }
        guard (titleTextField.text != nil), titleTextField.text != "" else {
            AlertManager.shared.showAlert(with: .emptyInput)
            return
        }
        guard (ageTextField.text != nil), ageTextField.text != "" else {
            
            AlertManager.shared.showAlert(with: .emptyInput)
            return
        }
        guard ( civilStatusTextField.text != nil), civilStatusTextField.text != "" else {
            
            AlertManager.shared.showAlert(with: .emptyInput)
            return
        }
        employee?.append(  Employee(employeeName: nameTextField.text!, employeeTitle: employeeTitlesEqualToEnum(title: titleTextField?.text ), employeeAge: 22, civilStatus: .single))
        self.delegate?.didAssignedAttributes(employee!)
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
    
    private func employeeTitlesEqualToEnum (title: String?) -> EmployeeTitle {
        switch title {
        case employeeTitles[0]:
            return EmployeeTitle.junior
        case employeeTitles[1]:
            return EmployeeTitle.mid
        case employeeTitles[2]:
            return EmployeeTitle.senior
        case employeeTitles[3]:
            return EmployeeTitle.architecture
        case employeeTitles[4]:
            return EmployeeTitle.manager
        default:
            return EmployeeTitle.junior

        }
    }
    
}
