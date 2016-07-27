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
    
    static func start(withConsumer consumer: (Subreddit?) -> Void) -> Pipeline {
        
        return LocationManager()
            |> Geocoder()
            |> cityNameFromPlacemark
            |> RedditClient.getSubredditForName()
            |> consumer
    }
    
    private init() { }
}