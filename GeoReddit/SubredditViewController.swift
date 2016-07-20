//
//  SubredditViewController.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import UIKit
import Pipeline


class SubredditViewController: UIViewController, ConsumerType, UITableViewDelegate, UITableViewDataSource {
    
    typealias InputType = Subreddit
    
    @IBOutlet var tableView: UITableView!
    
    var posts: [RedditPost] = []
    
    var pipeline: Pipeline?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "post")
        
        pipeline = GeoReddit.start(withConsumer: self)
    }
    
    func consume(subreddit: Subreddit) {
        
        dispatch_async(dispatch_get_main_queue()) { [weak self] in
            
            self?.posts = subreddit.posts
            
            self?.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("post")!
        
        let post = posts[indexPath.row]
        
        cell.textLabel?.text = post.author
        
        return cell
    }
}

