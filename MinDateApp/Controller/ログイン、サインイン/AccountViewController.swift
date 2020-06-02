//
//  AccountViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/02/25.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase


protocol SignUpViewInterface:class{
    var mail:String?{get}
    var password:String?{get}
    func toList()
}

class SignUpViewController: UIViewController, SignUpViewInterface{
    var mail: String?{
        return self.mailadress.text
    }
    
    var password: String?{
        return self.Password.text
    }
    
    func toList() {
        self.performSegue(withIdentifier: "TimeLine", sender: self.auth.currentUser!)
    }
    
   
    @IBOutlet weak var mailadress: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    var auth:Auth!
    var presenter :SignUpPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        mailadress.delegate = self
        Password.delegate = self
        presenter = SignUpPresenter(with: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        presenter.viewWillAppear()
//        if auth.currentUser != nil {auth.currentUser?.reload(completion: { error in
//            if error == nil {if self.auth.currentUser?.isEmailVerified == true {
//                self.performSegue(withIdentifier: "TimeLine", sender: self.auth.currentUser!)
//            } else if self.auth.currentUser?.isEmailVerified == false {
//           let alert = UIAlertController(title: "確認用メールを送信しているので確認をお願いします。", message: "まだメール認証が完了していません。", preferredStyle: .alert)
//           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//           self.present(alert, animated: true, completion: nil)
//
//                }
//            }
//        })
//
//    }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "TimeLine" {
//            let nextViewController = segue.destination as!TabViewController
//            let les = nextViewController.viewControllers![0] as!TimeLineViewController
//            let gosettingviewcontroller = segue.destination as! TabViewController
//            let res = gosettingviewcontroller.viewControllers![1] as!settingViewController
//            let user = sender as! User
//            les.me = AppUser(data: ["userID": user.uid])
//            res.me = AppUser(data: ["userID": user.uid])
//        }
//    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        presenter.signUpButtonTaped()
    }
    
    
    func presentAlert(){
        let alert = UIAlertController(title: "仮登録を行いました。", message: "入力したメールアドレス宛に確認メールを送信しました。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func presentVaridateAlert(){
        let alert = UIAlertController(title: "確認用メールを送信しているので確認をお願いします。", message: "まだメール認証が完了していません。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}


//キーボード閉じるyo

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}







