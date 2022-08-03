//
//  customTbaleView.swift
//  MinDateApp
//
//  Created by USER on 2020/03/11.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit

class  CustomTableView:UITableView{
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
             didSet {
                 layer.cornerRadius = cornerRadius
             }
         }
    
    
}
