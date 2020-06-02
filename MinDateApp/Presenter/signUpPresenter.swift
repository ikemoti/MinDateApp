//
//  signUpPresenter.swift
//  MinDateApp
//
//  Created by Sousuke Ikemoto on 2020/05/26.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase


class SignUpPresenter{
    
    let authModel:AuthModel
    weak var view:SignUpViewInterface?
    
    init(with view:SignUpViewInterface) {
        self.view = view
        self.authModel = AuthModel()
        authModel.delegate = self
    }
//    func viewWillAppear(){
//        if authModel.isUserVerified(){
//            view?.toList()}
//    }
    func signUpButtonTaped(){
        guard let mail = view?.mail else{ return}
        guard let password = view?.password else {return}
        authModel.signUp(with: mail, and: password)
//        if authModel.isUserVerified(){
//                   view?.toList()}
//        
    }
//    func loginButtonTapped(){
//        view?.toLogin()
//
//    }
}
extension SignUpPresenter:AuthModelDelegate{
    func didSignUp(newUser:User ) {
        authModel.sendEmailVerification(to: newUser)
    }
}
