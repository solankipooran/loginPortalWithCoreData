//
//  AlertController.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 16/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit

class AlertController {
    static func showalert(title : String , message : String, vc: UIViewController , handler: ((UIAlertAction) -> Void)? = nil){
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okaction = UIAlertAction(title: "OK", style: .cancel, handler: handler)
        controller.addAction(okaction)
        vc.present(controller, animated: true, completion: nil)
    }
}
