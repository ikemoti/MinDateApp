//
//  SignInViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/03/03.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

protocol LoginViewInterface: class {
    var email: String? { get }
    var password: String? { get }
    func toList()
  
}

class LoginInViewController: UIViewController,UITextFieldDelegate,LoginViewInterface{
    var email: String?{
        return mailadress.text
    }
    
    var password: String?{
        return Password.text
    }
    
    func toList() {
        self.performSegue(withIdentifier: "SignUp", sender:nil)
    }
    @IBOutlet weak var mailadress: UITextField!
    
 
    @IBOutlet weak var Password: UITextField!
    var auth:Auth!
    var presenter :LoginPresenter!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mailadress.delegate = self
        Password.delegate = self
        auth = Auth.auth()
          presenter = LoginPresenter(with: self)
        
    }
    
//    @IBAction func SignInButton() {
//        let email = mailadressSI.text!
//               let password = passwordSI
//                .text!
//
//               Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//                   if error == nil, let result = result, result.user.isEmailVerified {
//                       self.performSegue(withIdentifier: "TimeLine", sender: result.user)
//                   }
//    }
//    }
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        print("roguinn")
        presenter.loginButtonTapped()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp"{
        let user = sender as! User
       let nextViewController = segue.destination as!TabViewController
       let les = nextViewController.viewControllers![0] as!TimeLineViewController
       let gosettingviewcontroller = segue.destination as! TabViewController
       let res = gosettingviewcontroller.viewControllers![1] as!settingViewController
      
       les.me = AppUser(data: ["userID": user.uid])
       res.me = AppUser(data: ["userID": user.uid])
        }
    }

}
