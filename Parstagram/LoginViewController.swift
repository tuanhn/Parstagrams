//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Tu A Nguyen on 2/20/20.
//  Copyright © 2020 Tu Anh Nguyen. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameField.text = ""
        passwordField.text = ""
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil {
                print("success")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("failed")
                print("Error: \(error?.localizedDescription ?? "FAILED LOGIN")")
            }
        }
        
        
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        
        user.username = usernameField.text!
        user.password = passwordField.text!
        
        user.signUpInBackground { (success, error) in
            if success {
                print ("success")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print ("failure")
                print("Error: \(error?.localizedDescription ?? "FAILED LOGIN")")
            }
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
