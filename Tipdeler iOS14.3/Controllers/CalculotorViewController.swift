//
//  ViewController.swift
//  Tipdeler iOS14.3
//
//  Created by Hans Aangeenbrug on 03/01/2021.
//

import UIKit

class CalculotorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var delerBrain = DelerBrain()
    var pctTip: Int = 0

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        deselectButtons()
        sender.isSelected = true
        
        let perc = sender.currentTitle ?? "0.0"
        if perc == "0%" {
            pctTip = 0
        } else if perc == "10%" {
            pctTip = 10
        } else if perc == "20%" {
            pctTip = 20
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let numPeople = Int(sender.value)
        splitNumberLabel.text = String(numPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var total: Float
        var tip: Float
        var people: Int
        
        total = Float(billTextField.text!)!
        tip = Float(pctTip) / Float(100)
        people = Int(splitNumberLabel.text!)!

        delerBrain.BerekenDeel(total: total , tip: tip, human: people)
        self.performSegue(withIdentifier: "gaatResultaat", sender: self)
    }
    
    func deselectButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gaatResultaat" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.equalPart = String(format: "%.2f", delerBrain.getDeel())
            destinationVC.numberPartisipants = delerBrain.getMens()
            destinationVC.tipPercentage = String(" \(Int(100 * delerBrain.getTip()))%")
        }
    }
}

