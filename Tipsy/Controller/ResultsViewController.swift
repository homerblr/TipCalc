//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Homer on 8/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingLabel: UILabel!
    
    var totalNumber : Double = 0
    var numberOfPeople : Double = 0
    var tipAmmount : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalNumber)
        let stringNumberOfPeople = String(format: "%.0f", numberOfPeople)
        let fullTip = tipAmmount * 100
        let stringTip = String(format: "%.0f", fullTip)
        settingLabel.text = "Split your харчи with \(stringNumberOfPeople) people with \(stringTip)% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
