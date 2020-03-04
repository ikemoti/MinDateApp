//
//  SignInViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/03/03.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController,UITextFieldDelegate {

    
    var auth:Auth!
    @IBOutlet weak var mailadressSI: UITextField!
    @IBOutlet weak var passwordSI: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        mailadressSI.delegate = self
        passwordSI.delegate = self

        auth = Auth.auth()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButton() {
        let email = mailadressSI.text!
               let password = passwordSI
                .text!

               Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                   if error == nil, let result = result, result.user.isEmailVerified {
                       self.performSegue(withIdentifier: "TimeLine", sender: result.user)
                   }
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let user = sender as! User
       let nextViewController = segue.destination as!tabViewController
       let les = nextViewController.viewControllers![0] as!TimeLineViewController
       let gosettingviewcontroller = segue.destination as! tabViewController
       let res = gosettingviewcontroller.viewControllers![1] as!settingViewController
      
       les.me = AppUser(data: ["userID": user.uid])
       res.me = AppUser(data: ["userID": user.uid])
        
        
      
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
