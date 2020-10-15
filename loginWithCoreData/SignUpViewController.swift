//
//  SignUpViewController.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 16/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var signupnametxtfield: UITextField!
    @IBOutlet weak var signupemailtxtfield: UITextField!
    @IBOutlet weak var signuppasswordtxtfield: UITextField!
    @IBOutlet weak var signupconfirmpasswordtxtfield: UITextField!
    @IBOutlet weak var signupoutletbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func signupButton(_ sender: Any) {
        let username = signupnametxtfield.text ?? ""
        let emailorphone = signupemailtxtfield.text ?? ""
        let password = signuppasswordtxtfield.text ?? ""
        let confirmpassword = signupconfirmpasswordtxtfield.text ?? ""
        
        if username.isEmpty || emailorphone.isEmpty || password.isEmpty || confirmpassword.isEmpty {
            AlertController.showalert(title : "You Missed Something" , message: "Please fill details", vc: self)
            return
        }
        
        if CoreDataManager.validateEmail(enteredEmail: emailorphone){
            let signuppredicate = NSPredicate(format: "emailorphone == '\(emailorphone)'")
            let userexist = CoreDataManager.fetchdata(predicate: signuppredicate , entityname: "User")
            if userexist?.count != 0 {
                AlertController.showalert(title: "Sorry", message: "This Username already Exist", vc: self)
            }else{
                let dict = ["username": username, "password": password, "emailorphone": emailorphone]
                
                CoreDataManager.savedata(data: dict , entityname: "User")
                AlertController.showalert(title : "Congratulation" , message: "You have Successfully Signup", vc: self , handler: {action in
                    self.navigationController?.popToRootViewController(animated: true)
                })
            }
        }else{
             AlertController.showalert(title : "Its Not a mail or phone" ,message: "Please enter a mail or phone" , vc: self)
        }
        
        if (password != confirmpassword) {
            AlertController.showalert(title : "You Missed Something" ,message: "Passwords Are not Matched" , vc: self)
            return
        }

        
    }
    
}
