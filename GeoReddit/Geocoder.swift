//
//  Geocoder.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import CoreLocation
import Pipeline

final class Geocoder: TransformerType {
    
    typealias InputType = CLLocation
    
    typealias OutputType = CLPlacemark
    
    var consumer: (CLPlacemark -> Void)?
    
    let geocoder = CLGeocoder()
    
    func consume(location: CLLocation) {
        
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemark, error) in
            
            if let place = placemark?.first {
                
                self?.consumer?(place)
            }
        }
    }
}

func cityNameFromPlacemark(place: CLPlacemark) -> String {
    
    return place.addressDictionary!["City"] as! String
}