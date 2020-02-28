//
//  AccountViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/02/25.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    @IBOutlet weak var mailadress: UITextField!
    
    
    @IBOutlet weak var Password: UITextField!
    
    
    var auth:Auth!
    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        mailadress.delegate = self
        Password.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if auth.currentUser != nil {
            auth.currentUser?.reload(completion: { error in
                if error == nil {
                    if self.auth.currentUser?.isEmailVerified == true {
                        self.performSegue(withIdentifier: "TimeLine", sender: self.auth.currentUser!)
                                            } else if self.auth.currentUser?.isEmailVerified == false {
                        let alert = UIAlertController(title: "確認用メールを送信しているので確認をお願いします。", message: "まだメール認証が完了していません。", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimeLine" {
            let nextViewController = segue.destination as!tabViewController
            let les = nextViewController.viewControllers![0] as!TimeLineViewController
            let user = sender as! User
            
            les.me = AppUser(data: ["userID": user.uid])
         
            
        }
    }
    
    
    
    @IBAction func registerButton() {
        let email = mailadress.text!
            let password = Password.text!
            auth.createUser(withEmail: email, password: password) { (result, error) in
                if error == nil, let result = result {
                    result.user.sendEmailVerification(completion: { (error) in
                        if error == nil {
                            let alert = UIAlertController(title: "仮登録を行いました。", message: "入力したメールアドレス宛に確認メールを送信しました。", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    })
                }
            }
        }
    }
    


extension AccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}







