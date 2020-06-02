//
//  LoginPresenter.swift
//  MinDateApp
//
//  Created by Sousuke Ikemoto on 2020/05/26.
//  Copyright © 2020 USER. All rights reserved.
//

import Firebase

class LoginPresenter {
    
    let authModel: AuthModel
    weak var view: LoginViewInterface?
    
    init(with view: LoginViewInterface) {
        self.view = view
        self.authModel = AuthModel()
        authModel.delegate = self
    }
    
    func loginButtonTapped() {
        guard let email = view?.email else { return }
        guard let password = view?.password else { return }
        authModel.login(with: email, and: password)
        print("ログイン1")
    }
}

extension LoginPresenter: AuthModelDelegate {
    func didLogIn(isEmailVerified: Bool) {
        if isEmailVerified {
            print ("ログイン2")
            view?.toList()
        }else{fatalError()}
    }
    
}
