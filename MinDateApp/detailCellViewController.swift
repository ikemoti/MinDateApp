//
//  detailCellViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/03/01.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

class detailCellViewController: UIViewController {

    
    
    @IBOutlet weak var cellDateName: UILabel!
    
    var me :AppUser!
    
    var database:Firestore!
    var postArray: [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(me)
      
}
    
}
