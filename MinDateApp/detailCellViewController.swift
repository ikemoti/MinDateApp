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
    
    var cellPostID:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(me)
        print(cellPostID)
        database = Firestore.firestore()
      
}
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        print(cellPostID)
        print("ok")
        database.collection("posts").document("4KWpSVkAyXhq6ewazqYt").getDocument { (snapshot, error) in
            if error != nil{}
                guard let snapshot = snapshot, let data = snapshot.data()else{return}
                let post = Post(data:data)
                print(post.DateName)
            self.cellDateName.text = post.DateName
            print ("成功")
            print(post.DateName)
          }
    
}
}


//database.collection("users").document(postArray[indexPath.row].senderID).getDocument { (snapshot, error) in
//if error == nil, let snapshot = snapshot, let data = snapshot.data() {
//    let appUser = AppUser(data: data)
//    print(appUser.userName)
//    cell.detailTextLabel?.text = appUser.userName
