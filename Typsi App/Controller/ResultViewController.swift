//
//  ResultViewController.swift
//  Typsi App
//
//  Created by Bramdont José García Aponte on 15/1/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var resultValue: UILabel!
    var splitValues: Split?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        resultValue.text = String(format: "%.2f", splitValues?.value ?? 0.0)
        explanation.text = "Split between \((splitValues?.quantity)!) people, with \((splitValues?.tip)!)% tip."
    }
}
