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
    

    var me: AppUser!
    var database: Firestore!
    var postArray: [Post] = []
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Firestore.firestore()
        tableview.delegate = self
        tableview.dataSource = self
        print (me)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        database.collection("posts").getDocuments { (snapshot, error) in
            if error == nil, let snapshot = snapshot {
                self.postArray = []
                for document in snapshot.documents {
                    let data = document.data()
                    let post = Post(data: data)
                    self.postArray.append(post)
                    print(post)
                }
                self.tableview.reloadData()
            }
        }
        //ユーザーコレクションの中にme.userId をキーとして保存
        database.collection("users").document(me.userID).setData([
                   "userID": me.userID
                   ], merge: true)
        
        //AppUserをデータベースから取得する
        database.collection("users").document(me.userID).getDocument { (snapshot, error) in
        if error == nil, let snapshot = snapshot, let data = snapshot.data() {
            self.me = AppUser(data: data)
               
    }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
         cell.textLabel?.text = postArray[indexPath.row].DateName
        
        
        // 追加。それぞれの記事を投稿したユーザーをPostクラスのsenderIDを元に取得している。
        database.collection("users").document(postArray[indexPath.row].senderID).getDocument { (snapshot, error) in
            if error == nil, let snapshot = snapshot, let data = snapshot.data() {
                let appUser = AppUser(data: data)
                print(appUser.userName)
                cell.detailTextLabel?.text = appUser.userName // 今回は、ユーザー名をdetailTextLabelに表示。
            }
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailCell", sender: me )
        print(postArray[indexPath.row].postID)
        let storyborad:UIStoryboard = self.storyboard!
        let detailCellVc = storyboard?.instantiateViewController(identifier: "detailVC")as! detailCellViewController
        detailCellVc.cellPostID = postArray[indexPath.row].postID

        
    }
    
    @IBAction func addVC() {
        performSegue(withIdentifier: "ADD", sender: me)
    }
    
    
    
  
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ADD"{
        let destination = segue.destination as!AddViewController
        destination.me = sender as!AppUser
        }else if segue.identifier == "detailCell"{
            let destination2 = segue.destination as! detailCellViewController
            destination2.me = sender as!AppUser
            
        }
    }
    

}
