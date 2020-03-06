//
//  suggest2ViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/03/06.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import MapKit

class suggest2ViewController: UIViewController ,UISearchBarDelegate ,UITableViewDataSource,UITableViewDelegate,MKLocalSearchCompleterDelegate{
  
    

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
     
    var searchCompleter = MKLocalSearchCompleter()
       
       override func viewDidLoad() {
           super.viewDidLoad()
 tableView.delegate = self
       tableView.dataSource = self
           searchCompleter.delegate = self
          searchbar.delegate = self
       
        
       }
       
       func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

             guard let text = searchBar.text else { return false }

           searchCompleter.queryFragment = text
           
           print("text")
             return true
         }
       
       
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return searchCompleter.results.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "sugestcell2" ,for: indexPath)
       let completion = searchCompleter.results[indexPath.row]
       
       cell.textLabel?.text = completion.title
       return cell
   }
       
     
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //
           let completion = searchCompleter.results[indexPath.row]
           print ("\(completion.title)")
           let preVC = self.presentingViewController as!AddViewController
           
           
           preVC.Place2.text = completion.title
           self.dismiss(animated: true, completion: nil)
           print ("ok")
       }
             
          
          
       
       func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        tableView.reloadData()
           print("読み込んだよ")
          }
           
          // 検索が失敗したとき
          func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
              print ("エラー")
          }
       
       

    
   }

