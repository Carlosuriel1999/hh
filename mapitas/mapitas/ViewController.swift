//
//  ViewController.swift
//  mapitas
//
//  Created by Macbook on 10/10/18.
//  Copyright © 2018 ServiciosUHB. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    let locationManager = CLLocationManager()
    let location = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.delegate = self  // self es toda la clase y le damos los delegados para que implemente la clase
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization() //desired acurracy es para que presiso deseas que sea la ubica
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        locationManager.startUpdatingLocation()
        mapa.showsUserLocation = true
        
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: mapa.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009))
        
        mapa.setRegion(region, animated: true)
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {  //para saber locacisacion
        print(location.coordinate.latitude,location.coordinate.longitude)
        print(locations)
    }
}

