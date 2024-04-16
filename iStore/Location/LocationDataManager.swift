//
//  LocationViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 12.04.24.
//

import Foundation
import CoreLocation

final class LocationDataManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    @Published var address: String
    @Published var postalCode: String
    @Published var city: String
    @Published var state: String
    @Published var latitude: Double
    @Published var longitude: Double
    
    @Published var isCurrentLocation = false
    
    init(address: String, postalCode: String, city: String, state: String, latitude: Double, longitude: Double) {
        self.address = address
        self.postalCode = postalCode
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func requestUserLocationPermission() {
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            locationManager.requestLocation()
            
        case .restricted:
            break
            
        case .denied:
            break
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        default:
            break
        }
        
        locationManager.startUpdatingLocation()
    }
    
    func getUserAddress(completion: @escaping (CLPlacemark) -> Void) {
        if let Location = self.locationManager.location {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(Location) { (placemarks, error) in
                guard let address = placemarks?.first, error == nil else {
                    return
                }
                completion(address)
            }
        }
    }
}

extension LocationDataManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        getUserAddress { [weak self] placemark in
            guard let self else {
                return
            }
            
            guard let name = placemark.name,
                  let postalCode = placemark.postalCode,
                  let city = placemark.locality,
                  let state = placemark.administrativeArea,
                  let location = placemark.location else {
                return
            }
            
            self.address = name
            self.postalCode = postalCode
            self.city = city
            self.state = state
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error.localizedDescription)
    }
}
