//
//  AddViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/02/26.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController,UITextFieldDelegate{

    
    var me :AppUser!
    var database:Firestore!
    @IBOutlet weak var dateName: UITextField!
    @IBOutlet weak var Place1: UILabel!
    @IBOutlet weak var Place2: UILabel!
    @IBOutlet weak var Place3: UILabel!
    @IBOutlet weak var Place4: UILabel!
    @IBOutlet weak var Place5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        database = Firestore.firestore()
        dateName.delegate = self
      
       
        
        
        
        
        
        
        self.Place1.layer.borderWidth = 2.0
               self.Place1.layer.borderColor = UIColor.white.cgColor
               self.Place1.layer.backgroundColor = UIColor.white.cgColor
               self.Place2.layer.borderWidth = 2.0
               self.Place2.layer.borderColor = UIColor.white.cgColor
               self.Place2.layer.backgroundColor = UIColor.white.cgColor
               self.Place3.layer.borderWidth = 2.0
        self.Place3.layer.borderColor = UIColor.white.cgColor
        self.Place3.layer.backgroundColor = UIColor.white.cgColor
               self.Place4.layer.borderWidth = 2.0
               self.Place4.layer.borderColor = UIColor.white.cgColor
               self.Place4.layer.backgroundColor = UIColor.white.cgColor
               self.Place5.layer.borderWidth = 2.0
               self.Place5.layer.borderColor = UIColor.white.cgColor
               self.Place5.layer.backgroundColor = UIColor.white.cgColor
             
    }
    
    //投稿機能追加
    @IBAction func postcontent() {
//        let contentMemo = Memo.text!
        let DateName = dateName.text!
        let place1 = Place1.text!
        let place2 = Place2.text!
        let place3 = Place3.text!
        let place4 = Place4.text!
        let place5 = Place5.text!
        
        let saveDocument = Firestore.firestore().collection("posts").document()
        saveDocument.setData([
            "DateName":DateName,
            "place1" :place1,
            "place2" :place2,
            "place3" :place3,
            "place4" :place4,
            "place5" :place5,
//            "contentMemo": contentMemo,
            "postID": saveDocument.documentID,
            "senderID": me.userID,
           
        ]) { error in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
  
    
    
    
    //メモ欄　追加機能
//    func setupTextView() {
//        let toolBar = UIToolbar()
//        let flexibleSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
//        toolBar.items = [flexibleSpaceBarButton, doneButton]
//        toolBar.sizeToFit()
//        Memo.inputAccessoryView = toolBar
//    }
    
//    @objc func dismissKeyboard() {
//    Memo.resignFirstResponder()
//        }
    
    //テキストフィールド追加機能
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateName.resignFirstResponder()
       
        return true
    }
  
    
}
