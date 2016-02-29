//
//  LoginViewController.swift
//  TwitterApp
//
//  Created by Jason Tan on 2/22/16.
//  Copyright © 2016 JT. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController
{

    @IBOutlet weak var twitterLogo: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        twitterLogo.image = UIImage(named: ("twitter1"))       
        

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLoginButton(sender: AnyObject)
    {
        TwitterClient.sharedInstance.login({ () -> () in
            print("I've logged in!")
            self.performSegueWithIdentifier("loginSegue", sender: nil)
        }) { (error: NSError) -> () in
            print("Error: \(error.localizedDescription)")
        }

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
