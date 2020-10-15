//
//  LoginViewController.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 16/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginusernametxtfield: UITextField!
    @IBOutlet weak var loginpasswordtxtfield: UITextField!
    @IBOutlet weak var loginbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButton(_ sender: Any) {
        let emailid = loginusernametxtfield.text ?? ""
        let password = loginpasswordtxtfield.text ?? ""
        if emailid.isEmpty || password.isEmpty{
            AlertController.showalert(title : "You Missed Something" , message: "Please fill all details" , vc: self)
        }
        let predicate = NSPredicate(format: "emailorphone ==  '\(emailid)' AND password == '\(password)'")
        let info : [Any]? =  CoreDataManager.fetchdata(predicate: predicate ,entityname: "User")
        if info!.count > 0 {
            if let objectId = (info?.first as? NSManagedObject)?.objectID {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tablevc =   storyboard.instantiateViewController(identifier: "UserTableViewController") as? UserTableViewController
                tablevc!.loggedInmagnagedid = objectId
                self.navigationController?.pushViewController(tablevc!, animated: true)
            }
        }else{
            AlertController.showalert(title : "You Missed Something" ,message: "Invalid Username Or Password", vc: self)
        }
        
    }
    
    @IBAction func changepasswordvc(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let chngpassvc = story.instantiateViewController(identifier: "ChnagePasswordViewController")
        self.navigationController?.pushViewController(chngpassvc, animated: true)
    }
    
}
