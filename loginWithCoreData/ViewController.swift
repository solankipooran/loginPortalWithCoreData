//
//  ViewController.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 16/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SignupNewuserOutletBtn: UIButton!
    @IBOutlet weak var LoginOutletBtn: UIButton!
    @IBAction func SignupNewUserBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupVc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        navigationController?.pushViewController(signupVc, animated: true)
    }
    @IBAction func LoginBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        navigationController?.pushViewController(loginVc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
}


