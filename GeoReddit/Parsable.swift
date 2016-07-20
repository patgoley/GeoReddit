//
//  Parsable.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation

public protocol Parsable {
    
    static func createWithValues(value: [String: AnyObject]) -> Self
}