//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipValue : Double = 0
    var numberOfPeople : Double = 0
    var billTotal : Double = 0
    var result : Double = 0
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipValue = 0.0
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
             tipValue = 0.1
        } else if sender == twentyPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
             tipValue = 0.2
        }
        if let safeText = billTextField.text {
            billTotal = Double(safeText) ?? 0
            billTextField.endEditing(true)
        }
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = sender.value
        splitNumberLabel.text = String(format: "%.0f", numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
       print(tipValue)
        print(numberOfPeople)
        print(billTotal)
        result = billTotal * (1 + tipValue) / numberOfPeople
        print(result)
        let resultTo2Decimal = String(format: "%.2f", result)
        print(resultTo2Decimal)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.totalNumber = result
            destinationVC.tipAmmount = tipValue
        }
    }


}

