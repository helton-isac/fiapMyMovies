//
//  Movie.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 13/04/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var title: String;
    var categories: String;
    var duration: String;
    var rating: Double;
    var summary: String;
    var image: String;
}


