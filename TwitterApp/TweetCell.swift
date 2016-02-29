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

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 10
        profileImageView.clipsToBounds = true
        
    }

    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  

} // end class TweetCell
