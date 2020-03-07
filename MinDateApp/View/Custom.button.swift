//
//  Custom.button.swift
//  MinDateApp
//
//  Created by USER on 2020/03/07.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit

class CustomButton:UIButton{
    @IBInspectable var textColor: UIColor?
       
      @IBInspectable var cornerRadius: CGFloat = 10 {
          didSet {
              layer.cornerRadius = cornerRadius
          }
      }
       
      @IBInspectable var borderWidth: CGFloat = 0 {
          didSet {
              layer.borderWidth = borderWidth
          }
      }
       
    @IBInspectable var borderColor: UIColor = UIColor.clear {
          didSet {
            layer.borderColor = borderColor.cgColor
          }
      }

    
    
    
    
    
}
