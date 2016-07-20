//
//  Dedupe.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import Pipeline

func dedupe<T: Equatable>() -> FilterTransformer<T> {
    
    var lastValue: T? = nil
    
    return FilterTransformer<T>() { newValue in
        
        if newValue != lastValue {
            
            lastValue = newValue
            
            return false
        }
        
        return true
    }
}