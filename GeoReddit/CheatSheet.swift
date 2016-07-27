//
//  CheatSheet.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/26/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import Pipeline

func start(withConsumer consumer: (Subreddit?) -> Void) -> Pipeline {
    
    return LocationManager()
        |> Geocoder()
        |> cityNameFromPlacemark
        |> dedupe()
        |> RedditClient.getSubredditForName()
        |> consumer
}
    