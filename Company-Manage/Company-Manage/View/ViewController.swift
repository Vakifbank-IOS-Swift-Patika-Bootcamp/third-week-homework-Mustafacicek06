//
//  ViewController.swift
//  Company-Manage
//
//  Created by Mustafa Çiçek on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var companyFoundationYearLabel: UILabel!

    @IBOutlet private weak var companyIncomeLabel: UILabel!

    @IBOutlet private weak var companyExpenseLabel: UILabel!
    @IBOutlet private weak var companyEmployeesCountLabel: UILabel!


    @IBOutlet private weak var companyManageLabel: UILabel!

    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var addIncomeButton: UIButton!

    @IBOutlet weak var textField: UITextField!
    
    var selectedSegmentIndex = 0
    var companyIncome = 0
    var companyExpense: Int = 0
    var employees: [Employee] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       setupComponents()
        companyIncomeLabel.text = "Company Employees: \(companyIncome)"

        companyEmployeesCountLabel.text = "Company Employees: \(employees.count )"
        
        companyExpenseLabel.text = "Company Expense: \(companyExpense)"

    }
    // MARK: Private Functions
    private func setupComponents () {
        textField.keyboardType = .numberPad
        
    }
    private func calculateCompanyExpense() {
        employees.map { employee in
            self.companyExpense += employee.employeeSalary ?? 1
        }
    }
    // MARK: Public Functions
    
    
    // MARK: Actions
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        selectedSegmentIndex = (sender as! UISegmentedControl).selectedSegmentIndex

        if selectedSegmentIndex == 0 {
            self.addIncomeButton.setTitle("Add Income", for: .normal)
        }
        else {
            self.addIncomeButton.setTitle("Add Expense", for: UIControl.State.normal)
        }
    }

    @IBAction private func addEmployeeButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: VCManager.toNewEmployeePage.rawValue, sender: employees)
    }
    
    @IBAction private func salaryPaymentButtonClicked(_ sender: Any) {
        employees.map { employee in
            companyIncome -= employee.employeeSalary ??  0
        }
        companyIncomeLabel.text = "Company Income: \(companyIncome)"
        
    }
    
    @IBAction func employeListButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: VCManager.toEmployeeListPage.rawValue, sender: nil)
    }
    
    @IBAction private func addIncomeButtonClicked(_ sender: Any) {
        if textField.text != "" && textField.text != nil {
            if selectedSegmentIndex == 0 {
                // do something
                self.companyIncome += Int(textField.text!) ?? 0
                self.companyIncomeLabel.text = "Company Income : \(self.companyIncome)"
            }
            else {
                // do something
                self.companyExpense += Int(textField.text!) ?? 0
                self.companyExpenseLabel.text = "Company Expense : \(self.companyExpense)"
            }
        }
        else {
            AlertManager.shared.showAlert(with: AlertError.emptyInput)
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == VCManager.toNewEmployeePage.rawValue {
            let destinationVC = segue.destination as? NewEmployeeViewController
        
            destinationVC?.delegate = self
            destinationVC?.employee = self.employees
        }
        
        if segue.identifier == VCManager.toEmployeeListPage.rawValue {
            let destinationVC = segue.destination as? EmployeeListViewController
            destinationVC?.employee = self.employees
        }
    }
   
   
}


extension ViewController: NewEmployeeControllerDelegate {
    func didAssignedAttributes(_ employees: [Employee]) {
        self.employees = employees
        companyEmployeesCountLabel.text = "Company Employees: \(self.employees.count)"
        calculateCompanyExpense()
        companyExpenseLabel.text = "Company Expense: \(self.companyExpense)"
        
        

    }
    
   
    
   
}
