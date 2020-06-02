//
//  File.swift
//  MinDateApp
//
//  Created by Sousuke Ikemoto on 2020/05/25.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@objc protocol AuthModelDelegate: class {
    @objc optional func didSignUp(newUser:User)
    @objc optional func didLogIn(isEmailVerified: Bool)
    @objc optional func emailVerificationDidSend()
}

class AuthModel {
    weak var delegate: AuthModelDelegate?
    
    func signUp(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [unowned self] (user, error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            guard let user = user?.user else { return }
            self.delegate?.didSignUp?(newUser:user)
        }
    }
    func sendEmailVerification(to user: User) {
        user.sendEmailVerification() { [unowned self] error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            self.delegate?.emailVerificationDidSend?()
        }
    }
    func login(with email: String, and password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                              if error == nil, let result = result, result.user.isEmailVerified {
                                self.delegate?.didLogIn?(isEmailVerified:result.user.isEmailVerified)
//                                  self.performSegue(withIdentifier: "TimeLine", sender: result.user)
                              }
               }
       }
  
    func isUserVerified() -> Bool {
        guard let user = Auth.auth().currentUser else { return false }
        return user.isEmailVerified
    }
}
