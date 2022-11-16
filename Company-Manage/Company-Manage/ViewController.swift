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
    var companyExpense = 0
    var compnayEmployees = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       setupComponents()

    }
    // MARK: Private Functions
    private func setupComponents () {
        textField.keyboardType = .numberPad
        
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

    @IBAction func addIncomeButtonClicked(_ sender: Any) {
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
            
        }
      
    }
}
