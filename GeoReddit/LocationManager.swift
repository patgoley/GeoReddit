//
//  LocationManager.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import CoreLocation
import Pipeline

final class LocationManager: NSObject, CLLocationManagerDelegate, ConsumableType {
    
    typealias OutputType = CLLocation
    
    var consumer: (CLLocation -> Void)?
    
    let manager = CLLocationManager()
    
    override init() {
        
        super.init()
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            
            start()
        }
    }
    
    func start() {
        
        manager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = manager.location {
            
            consumer?(location)
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == .AuthorizedWhenInUse {
            
            start()
        }
    }
}