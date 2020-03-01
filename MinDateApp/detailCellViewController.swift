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
    
    var cellPostID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(me)
        print(cellPostID)
        database = Firestore.firestore()
      
}
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        database.collection("posts").document(cellPostID).getDocument { (snapshot, error) in
        if error == nil, let snapshot = snapshot, let data = snapshot.data() {
            let post = Post(data: data)
            self.cellDateName.text = post.DateName
               
    }
    
}
}
}
