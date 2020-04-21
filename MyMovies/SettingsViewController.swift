//
//  SettingsViewController.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 21/04/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var swPlay: UISwitch!
    
    @IBAction func changePlay(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "play")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swPlay.isOn = UserDefaults.standard.bool(forKey: "play")
    }
    
    
    
}
