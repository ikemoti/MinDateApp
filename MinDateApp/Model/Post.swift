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
//    let contentMemo: String
    let postID: String
    let senderID: String
    
    
    init(data: [String: Any]) {
        DateName = data["DateName"] as? String ?? "s"
        place1 = data["place1"] as? String ?? "s"
        place2 = data["place2"] as? String ?? "s"
        place3 = data["place3"] as? String ?? "s"
        place4 = data["place4"] as? String ?? "s"
        place5 = data["place5"] as? String ?? "s"
//        contentMemo = data["contentMemo"] as? String ?? "s"
        postID = data["postID"] as? String ?? "s"
        senderID = data["senderID"] as? String ?? "s"
        
    }
}

