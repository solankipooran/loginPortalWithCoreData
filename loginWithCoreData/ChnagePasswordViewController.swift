//
//  ChnagePasswordViewController.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 19/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class ChnagePasswordViewController: UIViewController {
    
    @IBOutlet weak var emailorphonetextfield: UITextField!
    @IBOutlet weak var oldapsswordtxtfld: UITextField!
    @IBOutlet weak var newpasswordtxtfld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changepassword(_ sender: Any) {
        let emailorphone = emailorphonetextfield.text ?? ""
        let oldpassword = oldapsswordtxtfld.text ?? ""
        let newpassword = newpasswordtxtfld.text ?? ""
        if emailorphone.isEmpty || oldpassword.isEmpty || newpassword.isEmpty {
            AlertController.showalert(title : "You Missed Something" , message: "Please fill all details" , vc: self)
            return
        }
        
        let chngpredicate = NSPredicate(format: "emailorphone == '\(emailorphone)' AND password == '\(oldpassword)'" )
        let newpass = ["password" : "\(newpassword)"]
        if CoreDataManager.updatevalue(predicate: chngpredicate, updates: newpass , entityname: "User") {
            AlertController.showalert(title : "Congratulation" , message: "Password Changed Successfully" , vc: self , handler: {action in
                self.navigationController?.popToRootViewController(animated: true)
            })
        }
        
        
    }
}
