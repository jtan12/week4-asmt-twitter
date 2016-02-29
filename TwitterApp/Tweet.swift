//
//  Tweet.swift
//  TwitterApp
//
//  Created by Jason Tan on 2/27/16.
//  Copyright © 2016 JT. All rights reserved.
//

import UIKit

class Tweet: NSObject
{
    
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var user: User?
    
    
    init(dictionary: NSDictionary)
    {
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        
        user = User(dictionary: (dictionary["user"] as? NSDictionary)!)
        
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString
        {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
    } // end init
   
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]
    {
        var tweets = [Tweet]()
    
        for dictionary in dictionaries
        {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
    
        return tweets
    } // end class func tweetsWithArray
    
    
} //end class Tweet
