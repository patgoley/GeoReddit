//
//  RedditClient.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation
import Pipeline

struct RedditClient {
    
    static func getSubredditForName() -> TransformerPipeline<String, Subreddit?> {
        
        return requestForSubreddit
            |> HTTPClient()
            |> deserializeJSONObject
            |> logError("error deserializing")
            |> Subreddit.createWithValues
            |> ensureMainThread()
    }
    
    private init() { }
}

func requestForSubreddit(name: String) -> NSURLRequest {
    
    let url = NSURL(string: "https://www.reddit.com/r/\(name).json")!
    
    return NSURLRequest(URL: url)
}