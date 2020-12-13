//
//  CustomTextField.swift
//  WindowShopper
//
//  Created by Lucas Castelan Prado on 12-12-20.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        customizeView()
    }

    override func awakeFromNib() {
        // super must be called so parents can do their implementation, if any
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        backgroundColor = #colorLiteral(red: 0.6236119924, green: 0.6236119924, blue: 0.6236119924, alpha: 0.5)
        textAlignment = .center
        layer.cornerRadius = 10.0
        font = UIFont(name:"Avenir", size: CGFloat(18))
        textColor = .white
        if let p = placeholder {
            attributedPlaceholder = NSAttributedString(
                string: p,
                attributes: [.foregroundColor: UIColor.white]
            )
        }
    }
    
}
