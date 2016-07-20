//
//  GeoReddit.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import Pipeline

struct GeoReddit {
    
    static func start<C: ConsumerType where C.InputType == Subreddit>(withConsumer consumer: C) -> Pipeline {
        
        return LocationManager()
            |> Geocoder()
            |> cityNameFromPlacemark
            |> dedupe()
            |> RedditClient.getSubredditForName()
            |> guardUnwrap()
            |> consumer
    }
    
    private static var pipeline: Pipeline!
    
    private init() { }
}