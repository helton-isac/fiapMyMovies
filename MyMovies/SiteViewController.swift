//
//  SiteViewController.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 16/05/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class SiteViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var site:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: site) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion:  nil)
    }
    

}
