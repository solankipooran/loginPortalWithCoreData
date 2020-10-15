//
//  UserTableViewController.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 17/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit
import CoreData

class UserTableViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
   
    @IBAction func logoutbtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    var loggedInmagnagedid : NSManagedObjectID!
    
    var userDetails : [NSManagedObject] = []
    
    static func getobject(){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else{
            return UITableViewCell()
        }
        let mainuser = userDetails[indexPath.row]
        
        if mainuser.objectID == loggedInmagnagedid {
            cell.indicatorimage.image = UIImage(named: "online")
        } else {
            cell.indicatorimage.image = UIImage(named: "offline")
        }
        
        cell.usernamelbl.text = mainuser.value(forKey: "username") as? String
        cell.emaillbl.text = mainuser.value(forKey: "emailorphone") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let data: NSManagedObject = userDetails[indexPath.row] as NSManagedObject
            let objctId = data.objectID
            if CoreDataManager.deletedata(ojctdelete : data, entityname: "User") {
                self.userDetails.remove(at: indexPath.row)
                tableView.beginUpdates()
                tableView.deleteRows(at:[indexPath], with: .automatic)
                tableView.endUpdates()
                if loggedInmagnagedid == objctId {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let users = CoreDataManager.fetchdata(predicate: nil ,entityname: "User")
        userDetails = users as! [NSManagedObject]
    }
    
}
