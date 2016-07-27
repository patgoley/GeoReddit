//
//  Threading.swift
//  Pipeline
//
//  Created by Patrick Goley on 5/20/16.
//  Copyright © 2016 arbiter. All rights reserved.
//

import Foundation
import Pipeline

func ensureMainThread<T>() -> AsyncTransformer<T, T> {
    
    return AsyncTransformer() { input, consumer in
        
        if NSThread.isMainThread() {
            
            consumer(input)
            
        } else {
            
            dispatch_async(dispatch_get_main_queue()) {
                
                consumer(input)
            }
        }
    }
}