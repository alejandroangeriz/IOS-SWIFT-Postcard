//
//  ViewController.swift
//  Postcard
//
//  Created by Alejandro Angeriz on 4/6/15.
//  Copyright (c) 2015 alejandro angeriz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //function for refreshing button text after set time (10 sec)
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterMessageTextField: UITextField!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendMailButtonPressed(sender: UIButton){
        //messageLabel actions
        messageLabel.hidden = false
        messageLabel.text = enterMessageTextField.text
        messageLabel.textColor = UIColor.redColor()
        //adding a comment here to test commits
        
        enterMessageTextField.text  = ""
        enterMessageTextField.resignFirstResponder()
        
        //nameLabel actions
        nameLabel.hidden = false
        nameLabel.text = enterNameTextField.text
        nameLabel.textColor = UIColor.blueColor()
        
        enterNameTextField.text = ""
        enterNameTextField.resignFirstResponder()
        
        mailButton.setTitle("Mail Sent", forState: UIControlState.Normal)
        
        //refresh button text function call.
        delay(10) {
            self.mailButton.setTitle("Send Mail", forState: UIControlState.Normal)
        }
        
        
           }

}

