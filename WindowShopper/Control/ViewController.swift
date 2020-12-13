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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myFirstButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        myFirstButton.setTitle("Calculate", for: .normal)
        myFirstButton.setTitleColor(.white, for: .normal)
        myFirstButton.backgroundColor = .orange
        
        myFirstButton.addTarget(self, action: #selector(ViewController.calculate), for: .touchUpInside)
        
        // To add to controller
        //self.view.addSubview(myFirstButton)
        
        // To add to number keyboard
        hourlyWage.inputAccessoryView = myFirstButton
        itemPrice.inputAccessoryView = myFirstButton
    }

    
    @objc func calculate() {
        if let wageTxt = hourlyWage.text, let priceTxt = itemPrice.text {
            if let wage = Double(wageTxt), let price = Double(priceTxt) {
                print("hourlyWage: \(wage)")
                print("itemPrice: \(price)")
                print("hours to work: \(Wage.getHours(hourlyWage: wage, itemPrice: price))")
                // UIView in the UIControllerView; Force responder to resign.
                view.endEditing(true)
            } else {
                print("Error: Cannot calculate, nil string")
            }
        } else {
            print("Error: Cannot calculate, nil text")
        }
    }
}

