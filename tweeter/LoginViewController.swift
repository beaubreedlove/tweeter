//
//  LoginViewController.swift
//  tweeter
//
//  Created by Beau Breedlove on 9/9/15.
//  Copyright (c) 2015 Tumblr. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignupClick(sender: UIButton) {
        
        var user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                println("Error\(errorString)")
            } else {
                // Hooray! Let them use the app now.
                println("HOORAY! You now have an account!")
            }
        }
    }
    
    @IBAction func onLoginClick(sender: UIButton) {
        let usernameString = emailField.text
        let passwordString = passwordField.text
        
        PFUser.logInWithUsernameInBackground(usernameString, password: passwordString) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                println("Successful login")
            } else {
                // The login failed. Check error to see why.
                println("Login failed!")
            }
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
