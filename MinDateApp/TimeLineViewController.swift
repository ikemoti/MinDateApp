//
//  TimeLineViewController.swift
//  MinDateApp
//
//  Created by USER on 2020/02/25.
//  Copyright © 2020 USER. All rights reserved.
//

import UIKit
import Firebase

class TimeLineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    var me:AppUser!
    var database: Firestore!
    var postArray: [Post] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
         cell.textLabel?.text = postArray[indexPath.row].content
        return cell
        
    }
    

    
    @IBAction func AddVC() {
        performSegue(withIdentifier: "ADD", sender: me)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as!AddViewController
        destination.me = sender as! AppUser
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
