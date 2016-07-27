//
//  JSON.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import Pipeline


func deserializeJSONObject(data: NSData) throws -> [String: AnyObject] {
    
    let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
    
    if let object = json as? [String: AnyObject] {
        
        return object
        
    } else {
        
        throw JSONError.CastError
    }
}

enum JSONError: ErrorType {
    
    case CastError
}