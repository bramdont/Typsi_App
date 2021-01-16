//
//  ViewController.swift
//  Typsi App
//
//  Created by Bramdont José García Aponte on 14/1/21.
//

import UIKit

class SplitViewController: UIViewController {

    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var splitQuantity: UILabel!
    @IBOutlet weak var grandTotal: UITextField!
    
    var quantity: Int = 2
    var tip: Int = 0
    var total: Float = 0.0
    var result: Float = 0.0
    
    var calculator = SplitCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipSelected(_ sender: UIButton) {
        let numeriValue = sender.currentTitle?.replacingOccurrences(of: "%", with: "")
        tip = Int(numeriValue!)!
    }
    
    @IBAction func changeSplitQuantity(_ sender: UIStepper) {
        quantity = Int(sender.value)
        updateUI()
    }
    
    func updateUI() {
        splitQuantity.text = String(quantity)
    }
    
    @IBAction func Calculate(_ sender: UIButton) {
        total = Float(grandTotal.text ?? "0.0")!
        calculator.calculate(total: total, tip: tip, quantity: quantity)
        
        result = calculator.getSplitResult()
       performSegue(withIdentifier: "goToResultScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultScreen"{
            let split = Split(grandTotal: total, quantity: quantity, tip: tip, value: result)
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.splitValues = split
        }
    }
}

