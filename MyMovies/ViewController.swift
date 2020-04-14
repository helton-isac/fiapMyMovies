//
//  ViewController.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 11/04/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    func loadMovies() {
        guard let fileURL = Bundle.main.url(forResource: "movies", withExtension: "json" )
            else { return }
        do {
            let data = try Data(contentsOf: fileURL)
            
            movies = try JSONDecoder().decode([Movie].self,
                                              from: data)
            
            for movie in movies {
                print(movie.title, "-", movie.duration)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

