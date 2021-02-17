//
//  RoundButton.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 17/02/21.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 5
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let color = UIColor.init(red: 102/255, green: 116/255, blue: 102/255, alpha: 1.0)
        
        backgroundColor = color
        
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
        
    }
}
