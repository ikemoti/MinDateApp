//
//  Post.swift
//  MinDateApp
//
//  Created by USER on 2020/02/25.
//  Copyright © 2020 USER. All rights reserved.
//

import Foundation
import Firebase

struct Post {
    let DateName:String
    let place1:String
    let place2:String
    let place3:String
    let place4:String
    let place5:String
    let contentMemo: String
    let postID: String
    let senderID: String
    let createdAt: Timestamp
    let updatedAt: Timestamp
    
    init(data: [String: Any]) {
        DateName = data["DateName"] as! String
        place1 = data["place1"] as! String
        place2 = data["place2"] as! String
        place3 = data["place3"] as! String
        place4 = data["place4"] as! String
        place5 = data["place5"] as! String
        contentMemo = data["contentMemo"] as! String
        postID = data["postID"] as! String
        senderID = data["senderID"] as! String
        createdAt = data["createdAt"] as! Timestamp
        updatedAt = data["updatedAt"] as! Timestamp
    }
}

