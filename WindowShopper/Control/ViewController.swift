//
//  ViewController.swift
//  WindowShopper
//
//  Created by Lucas Castelan Prado on 11-12-20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hourlyWage: CustomTextField!
    @IBOutlet weak var itemPrice: CustomTextField!
    
    @IBOutlet weak var calculatedLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var clearCalculationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let calculatorButtom = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculatorButtom.setTitle("Calculate", for: .normal)
        calculatorButtom.setTitleColor(.white, for: .normal)
        calculatorButtom.backgroundColor = .orange
        
        calculatorButtom.addTarget(self, action: #selector(ViewController.calculate), for: .touchUpInside)
        
        // To add to controller
        //self.view.addSubview(myFirstButton)
        
        // To add to number keyboard
        hourlyWage.inputAccessoryView = calculatorButtom
        itemPrice.inputAccessoryView = calculatorButtom
        
        calculatedLabel.isHidden = true
        calculatedLabel.textColor = .white
        hoursLabel.isHidden = true
        hoursLabel.textColor = .white
        clearCalculationButton.isHidden = true
        
        clearCalculationButton.addTarget(self, action:     #selector(ViewController.clearCalculation), for: .touchUpInside)
    }
    
    @objc func calculate() {
        if let wageTxt = hourlyWage.text, let priceTxt = itemPrice.text {
            if let wage = Double(wageTxt), let price = Double(priceTxt) {
                let hours = Wage.getHours(hourlyWage: wage, itemPrice: price)
                if let h = hours {
                    calculatedLabel.text = String(h)
                } else {
                    calculatedLabel.text = "Error"
                }
                // UIView in the UIControllerView; Force responder to resign.
                calculatedLabel.isHidden = false
                hoursLabel.isHidden = false
                clearCalculationButton.isHidden = false
                view.endEditing(true)
            } else {
                print("Error: Cannot calculate, bad string")
            }
        } else {
            print("Error: Cannot calculate, bad text")
        }
    }
    
    @objc func clearCalculation() {
        hourlyWage.text = ""
        itemPrice.text  = ""
        calculatedLabel.isHidden = true
        hoursLabel.isHidden = true
        clearCalculationButton.isHidden = true
    }
    
}

