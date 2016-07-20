//
//  HTTPClient.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import Pipeline

final class HTTPClient: TransformerType {
    
    typealias InputType = NSURLRequest
    
    typealias OutputType = NSData
    
    var consumer: (NSData -> Void)?
    
    let urlSession = NSURLSession.sharedSession()
    
    func consume(request: NSURLRequest) {
        
        let task = urlSession.dataTaskWithRequest(request) { [weak self] (data, response, error) in
            
            if let data = data,
                   consumer = self?.consumer {
                
                consumer(data)
            }
        }
        
        task.resume()
    }
}