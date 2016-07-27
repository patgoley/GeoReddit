//
//  SubredditViewController.swift
//  GeoReddit
//
//  Created by Patrick Goley on 7/19/16.
//  Copyright © 2016 patrickgoley. All rights reserved.
//

import UIKit
import Pipeline


class SubredditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var posts: [RedditPost] = []
    
    var pipeline: Pipeline?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "post")
        
        pipeline = GeoReddit.start() { [weak self] subreddit in
            
            self?.reloadData(subreddit)
        }
    }
    
    func reloadData(subreddit: Subreddit?) {
        
        self.posts = subreddit?.posts ?? []
        
        self.tableView.reloadData()
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

