//
//  Subreddit.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import Foundation


struct Subreddit: Parsable {
    
    let posts: [RedditPost]
    
    static func createWithValues(value: [String : AnyObject]) -> Subreddit {
        
        let data = value["data"] as! [String: AnyObject]
        
        let children = data["children"] as! [[String: AnyObject]]
        
        let posts = children.map(RedditPost.createWithValues)
        
        return Subreddit(posts: posts)
    }
}

struct RedditPost: Parsable {
    
    let author: String
    let created: Int
    let ups: Int
    let thumbnailURL: String
    
    static func createWithValues(value: [String : AnyObject]) -> RedditPost {
        
        let data = value["data"] as! [String : AnyObject]
        
        let author = data["author"] as! String
        let created = data["created"] as! Int
        let ups = data["ups"] as! Int
        let thumbnailURL = data["thumbnail"] as! String
        
        return RedditPost(author: author, created: created, ups: ups, thumbnailURL: thumbnailURL)
    }
}