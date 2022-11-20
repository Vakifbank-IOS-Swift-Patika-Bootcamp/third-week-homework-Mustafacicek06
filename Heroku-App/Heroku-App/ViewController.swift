//
//  ViewController.swift
//  Heroku-App
//
//  Created by Mustafa Çiçek on 20.11.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var quoteLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      getRandomQuote()
       
    }
    
    private func getRandomQuote() {
        NetworkClient.getQuotes { [weak self] quote, error in
            self?.quoteLabel.text = quote?.en
        }
    }
    


    @IBAction private func getQuoteButtonClicked(_ sender: Any) {
        getRandomQuote()
    }
}

