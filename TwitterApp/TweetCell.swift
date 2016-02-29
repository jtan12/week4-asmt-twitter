//
//  TweetCell.swift
//  TwitterApp
//
//  Created by Jason Tan on 2/28/16.
//  Copyright © 2016 JT. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell
{
    var twitter: String?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    @IBAction func retweetButton(sender: AnyObject)
    {       
        TwitterClient.sharedInstance.retweetCount(self.twitter!)
    }
    
    
    @IBAction func favoriteButton(sender: AnyObject) 
    {
        TwitterClient.sharedInstance.favoriteCount(self.twitter!)
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 10
        profileImageView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  

} // end class TweetCell
