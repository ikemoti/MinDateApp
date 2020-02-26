//
//  AddViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/02/26.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

    
    var me :AppUser!
    var database:Firestore!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
         database = Firestore.firestore()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func postcontent() {
        let content = textView.text!
        let saveDocument = Firestore.firestore().collection("posts").document()
        saveDocument.setData([
            "content": content,
            "postID": saveDocument.documentID,
            "senderID": me.userID,
            "createdAt": FieldValue.serverTimestamp(),
            "updatedAt": FieldValue.serverTimestamp()
        ]) { error in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupTextView() {
        let toolBar = UIToolbar()
        let flexibleSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        toolBar.items = [flexibleSpaceBarButton, doneButton]
        toolBar.sizeToFit()
        textView.inputAccessoryView = toolBar
    }

    @objc func dismissKeyboard() {
    textView.resignFirstResponder()

   
}
}
