//
//  UIViewController+CoreData.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 15/04/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    
    var context: NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
}
