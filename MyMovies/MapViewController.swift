//
//  MapViewController.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 13/05/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        mapView.showsUserLocation = true
        
        mapView.userTrackingMode = .follow
        
        requestAuthorization()
    }
    

    func requestAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
    }

}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
