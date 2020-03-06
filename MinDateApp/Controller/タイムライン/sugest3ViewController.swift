//
//  sugest3ViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/03/06.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import MapKit
class sugest3ViewController: UIViewController ,UISearchBarDelegate ,UITableViewDataSource,UITableViewDelegate,MKLocalSearchCompleterDelegate{
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var sugesttableView: UITableView!
    
var searchCompleter = MKLocalSearchCompleter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sugesttableView.delegate = self
        sugesttableView.dataSource = self
        searchCompleter.delegate = self
        searchBar.delegate = self
    
     
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
    let cell = sugesttableView.dequeueReusableCell(withIdentifier: "sugestcell3" ,for: indexPath)
    let completion = searchCompleter.results[indexPath.row]
    
    cell.textLabel?.text = completion.title
    return cell
}
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
        let completion = searchCompleter.results[indexPath.row]
        print ("\(completion.title)")
        let preVC = self.presentingViewController as!AddViewController
        preVC.Place3?.text = completion.title
        self.dismiss(animated: true, completion: nil)
        print ("ok")
    }
          
       
       
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
           sugesttableView.reloadData()
        print("読み込んだよ")
       }
        
       // 検索が失敗したとき
       func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
           print ("エラー")
       }
    
    

 
}

