//
//  CoreDataManager.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 17/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static func savedata(data: [String: Any] , entityname : String) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: entityname, in: context)
        let newuser = NSManagedObject(entity: entity!, insertInto: context)
        for (key, value) in data {
            newuser.setValue(value, forKey: key)
        }
        do{
            try context.save()
        }catch{
            print("failed")
        }  
    }
    
    static func fetchdata(predicate: NSPredicate? = nil , entityname : String) -> [Any]? {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityname)
        request.predicate = predicate
        do {
            let results = try context.fetch(request)
            return results
        }catch{
            print("error")
        }
        return nil
    }
    
    static func deletedata(ojctdelete :NSManagedObject, entityname : String) -> Bool {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        context.delete(ojctdelete)
        do {
            try context.save()
            return true
        } catch {
            print("error")
            return false
        }
    }
    
    static func updatevalue(predicate : NSPredicate  , updates : [String:String], entityname : String) -> Bool{
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityname)
        request.predicate = predicate
        do {
            let results = try context.fetch(request)
            if results.count != 0{
                let newManagedObject = results.first as? NSManagedObject
                for (key,value) in updates{
                    newManagedObject?.setValue(value, forKey: key)

                }
                return true
            }
            return false
            
        }catch{
            print("error")
            return false
        } 
    }
    
    static func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
}
