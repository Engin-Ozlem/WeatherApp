//
//  ViewController.swift
//  WeatherApp
//
//  Created by macbookair on 2.06.2023.
//

import UIKit
import CoreLocation


class ViewController: UIViewController , CLLocationManagerDelegate , UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searhBar: UISearchBar!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fahreinLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var CityName = ""
    var newCityName = ""
    var locationManager = CLLocationManager()
    var searchHistory: [String] = []
    public var weatherListViewModel : WeatherListViewModel!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searhBar.delegate = self
        
        
                locationManager.delegate = self
                locationManager.delegate = self
                locationManager.requestWhenInUseAuthorization()
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
                locationManager.startMonitoringSignificantLocationChanges()
                
                if CLLocationManager.locationServicesEnabled() {
                    switch CLLocationManager.authorizationStatus() {
                    case .authorizedAlways, .authorizedWhenInUse:
                        print("Location authorization granted.")
                        if let currentLocation = locationManager.location {
                            reverseGeocodeLocation(currentLocation)
                        }
                    case .notDetermined:
                        print("Location authorization not determined.")
                        // Kullanıcıya konum izni istenmemişse, burada kullanıcıya izin isteği gösterilebilir.
                    case .restricted:
                        print("Location authorization restricted.")
                        // Kullanıcının konum izni kısıtlanmışsa, burada gerekli geri bildirim verilebilir.
                    case .denied:
                        print("Location authorization denied.")
                        // Kullanıcı konum iznini reddetmişse, burada gerekli geri bildirim verilebilir.
                    }
                }
        
        
    }
    
    
   
    
    func reverseGeocodeLocation(_ location: CLLocation) {
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    print("Reverse geocoding error: \(error.localizedDescription)")
                    return
                }
                
                if let placemark = placemarks?.first {
                    if let city = placemark.locality {
                        self.CityName = city
                        self.newCityName = self.CityName.lowercased()
                        print("Current city: \(self.newCityName)")
                        self.cityLabel.text! = self.newCityName
                        self.getData(cityname: self.newCityName)
                        
                        
                    } else {
                        print("City information not available.")
                    }
                } else {
                    print("Placemark not found.")
                }
            }
        }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            cityLabel.text = searchText
                let normalizedText = normalizeText(searchText)
                getData(cityname: normalizedText)
            }
    }
    
    func normalizeText(_ text: String) -> String {
        var normalizedText = text
        if let range = normalizedText.range(of: "İ", options: .caseInsensitive) {
            normalizedText.replaceSubrange(range, with: "I")
        }
        return normalizedText.lowercased()
    }
    
    
    
    
    
}
    
    
    
    
    
    
                  
 
    
   
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    





