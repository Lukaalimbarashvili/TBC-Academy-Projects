//
//  ViewController.swift
//  Homework 44
//
//  Created by Luka Alimbarashvili on 6/18/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {


    let locationManager = CLLocationManager()

    var allBand :BandInfo? {
        didSet{
            DispatchQueue.main.async {
                print(self.allBand)
            }
        }
    }
    let responds = APIResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServiceEnabled()
        
        responds.getBands { (bands) in
            self.allBand = bands
        }

        
    }
    
    private func checkLocationServiceEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkAuthorizationStatus()
            print("ჩართულია")
        } else {
            print("გამორთულია")
        }
    }
    
    private func setupLocationManager() {
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest
       }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            locationManager.requestLocation()
        case .restricted:
            break
        default:
          print("Fef")
        }
    }



}


extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let coordinate = location.coordinate

        print("Lat: \(coordinate.latitude) Lng: \(coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationManager.stopUpdatingLocation()
    }
}

