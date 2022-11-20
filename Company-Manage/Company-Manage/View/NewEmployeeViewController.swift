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
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    
    private var pickerView = UIPickerView()

    
    weak var delegate: NewEmployeeControllerDelegate?

    
    // MARK: Variables
    
    var employee: [Employee]?
    var segmentedCivilStatus: String = "Married"
    
    
    private let employeeTitles = ["Junior", "Mid","Senior","Architecture","Manager"]
    private let civilStatus = ["Married", "Signle"]
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
   
    @IBAction func segmentedControlAction(_ sender: Any) {
        
        let selectedSegmentIndex = (sender as! UISegmentedControl).selectedSegmentIndex
        if selectedSegmentIndex == 0 {
            self.segmentedCivilStatus = "Married"
        }
        else {
            self.segmentedCivilStatus = "Single"
    
        }
    }
    @IBAction private func saveButtonClicked(_ sender: Any) {
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
       
        employee?.append(  Employee(employeeName: nameTextField.text!, employeeTitle: employeeTitlesEqualToEnum(title: titleTextField?.text ), employeeAge: Int(ageTextField?.text ?? "0") ?? 0, civilStatus: civilStatusEqualToEnum(status:    segmentedCivilStatus),employeeSalary:    calculateSalary()
            
        ))
        
        self.delegate?.didAssignedAttributes(employee!)
        AlertManager.shared.showAlert(with: .success)
    }
    private func calculateSalary() -> Int {
        return (Int(ageTextField?.text ?? "0") ?? 0) * employeeTitlesEqualToEnum(title: titleTextField?.text).rawValue * 500
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
    
    private func civilStatusEqualToEnum (status: String?) -> CivilStatus {
        switch status {
        case civilStatus[0]:
            return CivilStatus.married
        case civilStatus[1]:
            return CivilStatus.single
      
        default:
            return CivilStatus.single

        }
    }
    
    
}
