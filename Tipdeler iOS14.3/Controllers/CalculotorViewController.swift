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
    
    var tipPerc: Float = 0.0
    var numPeople: Int = 2
    var billTotal: Float = 0.0
    var deelBedrag: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        billTotal = Float(billTextField.text ?? "0.0")!
        
        deselectButtons()
        sender.isSelected = true
        
        let pctTip = sender.currentTitle ?? "0.0"
        if pctTip == "0%" {
            tipPerc = 0.0
        } else if pctTip == "10%" {
            tipPerc = 0.1
        } else if pctTip == "20%" {
            tipPerc = 0.2
        }
    
        print(String(format: "%.1f", tipPerc))
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
        numPeople = Int(sender.value)
        splitNumberLabel.text = String(numPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("Aantal mensen is \(numPeople)")
        
        print("Het te betalen bedrag is \(billTotal)")
        
        print("De gekozen TIP is \(tipPerc)")
        
        deelBedrag = billTotal * (1.0 + tipPerc) / Float(numPeople)
        
        print("De uitkomst is \(String(format: "%.2f", deelBedrag))")
    }
    
    func deselectButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

