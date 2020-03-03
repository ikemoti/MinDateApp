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
    
    
    @IBOutlet weak var cellDatePlace1: UILabel!
    
    
    @IBOutlet weak var cellDatePlace2: UILabel!
    
    @IBOutlet weak var cellDatePlace3: UILabel!
    
    
    @IBOutlet weak var cellDatePlace4: UILabel!
    
    
    
    var me :AppUser!
    
    var database:Firestore!
   
    var postArray: [Post] = []
    
    var pos :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Firestore.firestore()
        
    
       
        print ("読み込み成功")
        print (pos)
//
        database.collection("posts").document(pos).getDocument { (snapshot, error) in
        if error == nil, let snapshot = snapshot, let data = snapshot.data() {
            let post = Post(data: data)
            self.cellDateName.text = post.DateName
            self.cellDatePlace1.text = post.place1
            self.cellDatePlace2.text = post.place2
            self.cellDatePlace3.text = post.place3
            

        
            }}}}
    
   
//
//        database.collection("posts").document(pos).getDocument { (snapshot, error) in
//            if error == nil, let snapshot = snapshot, let data = snapshot.data() {
//                self.pos = Post(data: data)
//            }
//        }
//
//    }


    
  




