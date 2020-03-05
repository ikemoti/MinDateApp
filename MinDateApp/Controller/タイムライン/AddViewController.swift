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
    
    @IBOutlet weak var Place1: UITextField!
    @IBOutlet weak var Place2: UITextField!
    @IBOutlet weak var Place3: UITextField!
    @IBOutlet weak var Place4: UITextField!
    @IBOutlet weak var Place5: UITextField!
    
//    @IBOutlet weak var Memo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupTextView()
        database = Firestore.firestore()
        dateName.delegate = self
        Place1.delegate = self
        Place2.delegate = self
        Place3.delegate = self
        Place4.delegate = self
        Place5.delegate = self
    }
    
    //投稿機能
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
        Place1.resignFirstResponder()
        Place2.resignFirstResponder()
        Place3.resignFirstResponder()
        Place4.resignFirstResponder()
        return true
    }
  
    
}
