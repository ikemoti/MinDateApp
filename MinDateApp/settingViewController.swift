//
//  settingViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/02/28.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore

class settingViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    var me :AppUser!
    var database:Firestore!
    
    @IBOutlet weak var imageView: UIImageView!
       
    
    let imagePicker = UIImagePickerController()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        usernameTextField.text = me.userName
        
    }
   
    
    @IBAction func selectImage(_ sender: Any) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
        print(imageView.image )
       }
       
    
   
     fileprivate   func upload(completed: @escaping(_ url: String?) -> Void) {
          let date = NSDate()
          let currentTimeStampInSecond = UInt64(floor(date.timeIntervalSince1970 * 1000))
          let storageRef = Storage.storage().reference().child("images").child("\(currentTimeStampInSecond).jpg")
          let metaData = StorageMetadata()
          metaData.contentType = "image/jpg"
          if let uploadData = self.imageView.image?.jpegData(compressionQuality: 0.9) {
              storageRef.putData(uploadData, metadata: metaData) { (metadata , error) in
                  if error != nil {
                    completed(nil)
                      print("error: \(error?.localizedDescription)")
                  }
                  storageRef.downloadURL(completion: { (url, error) in
                      if error != nil {
                        completed(nil)
                          print("error: \(error?.localizedDescription)")
                      }
                      completed("url: \(url?.absoluteString)")
                  })
              }
          }
      }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func changeusername() {
        let newUserName = usernameTextField.text!
               Firestore.firestore().collection("users").document(me.userID).setData([
                   "userName": newUserName
               ], merge: true)
               }
//   fileprivate func saveToFireStore(){
//       var data: [String : Any] = [:]
//       upload(){ url in
//           guard let url = url else {return }
//           data["userImage"] = url
//        Firestore.firestore().collection("users").document(self.me?.userImage as! String).setData(
//        ["userImage":data]){ error in
//               if error != nil {
//                   print("error: \(error?.localizedDescription)")
//               }
//               print("image saved!")
//           }
//       }
//   }
//
//







}






//写真を選んだ後に呼ばれる処理
extension settingViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]) {
            if let pickedImage =  info[.originalImage] as? UIImage {
                imageView.contentMode = .scaleAspectFit
                imageView.image = pickedImage
            }
            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
        
    }

