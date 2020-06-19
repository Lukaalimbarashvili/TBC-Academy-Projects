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

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var cloud: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    let locationManager = CLLocationManager()
    
    var tempLat : String?
    var tempLong: String?

    var forecast :weather? {
        didSet {
            DispatchQueue.main.async {
                self.temp.text     = "\(String(describing: self.forecast!.currently!.temperature!)) F"
                self.cloud.text    = self.forecast?.currently?.icon
                self.humidity.text = "Humidity : \(String(self.forecast!.currently!.humidity))"
                self.pressure.text = "Pressure : \(String(self.forecast!.currently!.pressure))"
                
             
                
                if  self.forecast?.currently?.icon == "rain" {
                    self.mainImageView.image = UIImage(named: "rain")
                } else if self.forecast?.currently?.icon == "cloudy" {
                    self.mainImageView.image = UIImage(named: "rain")
                } else if self.forecast?.currently?.icon == "sunny" {
                    self.mainImageView.image = UIImage(named: "rain")
                }
            }
          
            
        }
    }
    let responds = APIResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServiceEnabled()
        
       
        
    }
    
    @IBAction func onShowForecast(_ sender: Any) {
        performSegue(withIdentifier: "xyz", sender: nil)
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "xyz" {
            if let viewController = segue.destination as? forecastVC {
                viewController.tempForecast = forecast?.daily
            }
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
        
        tempLat = String(coordinate.latitude)
        tempLong = String(coordinate.longitude)
        
        responds.weatherApi(lat: "\(coordinate.latitude)", long: "\(coordinate.longitude)") { (info) in
            self.forecast = info
        }

        print("Lat: \(coordinate.latitude) Lng: \(coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationManager.stopUpdatingLocation()
    }
}

