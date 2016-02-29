
//
//  TweetsViewController.swift
//  TwitterApp
//
//  Created by Jason Tan on 2/28/16.
//  Copyright © 2016 JT. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    var tweets: [Tweet]!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
 
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            
            for tweet in tweets
            {
                print(tweet.text!) // print the tweets
            }
        }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
        })
        
        

    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogoutButton(sender: AnyObject)
    {
        TwitterClient.sharedInstance.logout()
        print("I've logged out!")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tweets != nil
        {
            return tweets!.count
        } else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        
        let tweet = tweets![indexPath.row]
        
        cell.profileImageView.setImageWithURL(tweet.user!.profileUrl!)
        cell.nameLabel.text = tweet.user!.name as? String
        cell.usernameLabel.text = tweet.user!.screenname as? String
        cell.timestampLabel.text = tweet.timestamp as? String
        cell.tweetLabel.text = tweet.text as? String
 
        
        return cell
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
