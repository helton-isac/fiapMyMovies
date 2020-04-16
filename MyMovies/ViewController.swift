//
//  ViewController.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 11/04/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var tvSummary: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            ivMovie.image = UIImage(named: movie.image)
            lbTitle.text = movie.title
            lbCategories.text = movie.categories
            lbDuration.text = movie.duration
            lbRating.text = "⭐️ \(movie.rating)/10"
            tvSummary.text = movie.summary
        }
    }
    
    
    
}

