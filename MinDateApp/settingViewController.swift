//
//  settingViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/02/28.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

class settingViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    var me :AppUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        usernameTextField.text = me.userName
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func changeusername() {
        let newUserName = usernameTextField.text!
               Firestore.firestore().collection("users").document(me.userID).setData([
                   "userName": newUserName
               ], merge: true)
               }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


