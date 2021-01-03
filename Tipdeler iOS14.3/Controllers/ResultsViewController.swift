//
//  ResultsViewController.swift
//  Tipdeler iOS14.3
//
//  Created by Hans Aangeenbrug on 03/01/2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var equalPart: String?
    var tipPercentage: String?
    var numberPartisipants: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = equalPart
        settingsLabel.text = "Split between \(numberPartisipants!) with a \(tipPercentage!) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
