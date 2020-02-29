//
//  AppUser.swift
//  MinDateApp
//
//  Created by USER on 2020/02/25.
//  Copyright © 2020 USER. All rights reserved.
//

import Foundation
import Firebase

struct AppUser {
    let userID: String
    let userName: String
    let userImage :Any
    
    
    init(data: [String: Any]) {
        userID = data["userID"] as! String
        userName = data["userName"] as? String ?? "匿名"
        userImage = data["userImage"]as? Any ?? ""
    }
}
