//
//  ViewController.swift
//  JWAuthUserViewController
//
//  Created by Jackson Wang on 5/1/16.
//  Copyright © 2016 Jackson Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var signInButton : UIButton!
    var signUpButton : UIButton!
    var underLine : UIView!
    var underLine_currentPosition = 0
    var distance : CGFloat!
    
    @IBOutlet weak var in_email_line: UIView!
    @IBOutlet weak var in_password_line: UIView!
    @IBOutlet weak var up_email_line: UIView!
    @IBOutlet weak var up_password_line: UIView!
    @IBOutlet weak var up_confirmPassword_line: UIView!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var in_email: UITextField!
    @IBOutlet weak var in_password: UITextField!
    @IBOutlet weak var in_submitButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var up_email: UITextField!
    @IBOutlet weak var up_password: UITextField!
    @IBOutlet weak var up_confirmPassword: UITextField!
    @IBOutlet weak var up_submitButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupViews()
        
        setupUserInteraction()
                
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dismissView(sender: AnyObject) {
        
//        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    // SIGN IN VIEW ACTIONS:
    @IBAction func signIn(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func forgotPassword(sender: AnyObject) {
        
        
        
    }
    
    // SIGN UP VIEW ACTIONS:
    
    @IBAction func signUp(sender: AnyObject) {
        
        
        
    }
    
    
    
    
    
    func setupViews() {
        
        // SET TEXTFIELD DELEGATE
        in_email.delegate = self
        in_password.delegate = self
        up_email.delegate = self
        up_password.delegate = self
        up_confirmPassword.delegate = self
        
        // FORGOT BUTTON
        forgotButton.titleLabel!.font = UIFont(name: "manifoldCF-Regular", size: 16)
        
        
        // SUBMIT BUTTONS
        in_submitButton.setTitle("Sign In", forState: .Normal)
        in_submitButton.titleLabel?.font = UIFont(name: "manifoldCF-DemiBold", size: 22)
        in_submitButton.layer.cornerRadius = 8
        in_submitButton.layer.borderWidth = 1
        in_submitButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        up_submitButton.setTitle("Sign Up", forState: .Normal)
        up_submitButton.titleLabel?.font = UIFont(name: "manifoldCF-DemiBold", size: 22)
        up_submitButton.layer.cornerRadius = 8
        up_submitButton.layer.borderWidth = 1
        up_submitButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        
        let _y : CGFloat = 80
        let _width : CGFloat = 80
        let _height : CGFloat = 25
        
        // SIGN IN BUTTON
        let in_x : CGFloat = self.view.bounds.width / 2 - 120
        let signInFrame = CGRectMake(in_x, _y, _width, _height)
        
        signInButton = UIButton(frame: signInFrame)
        signInButton.setTitle("Sign In", forState: .Normal)
        signInButton.titleLabel?.font = UIFont(name: "manifoldCF-Regular", size: 24)
        signInButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signInButton.addTarget(self, action: #selector(signInPressed), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(signInButton)
        
        //SIGN UP BUTTON
        let up_x : CGFloat = self.view.bounds.width / 2 + 40
        let signUpFrame = CGRectMake(up_x, _y, _width, _height)
        
        signUpButton = UIButton(frame: signUpFrame)
        signUpButton.setTitle("Sign Up", forState: .Normal)
        signUpButton.titleLabel?.font = UIFont(name: "manifoldCF-Regular", size: 24)
        signUpButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signUpButton.addTarget(self, action: #selector(signUpPressed), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(signUpButton)
        
        // UNDERLINE
        let line_x : CGFloat = in_x
        let line_y : CGFloat = _y + _height + 5
        let line_width : CGFloat = _width
        let line_height : CGFloat = 2
        let lineFrame = CGRectMake(line_x, line_y, line_width, line_height)
        
        underLine = UIView(frame: lineFrame)
        underLine.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(underLine)
        
        // CALCULATE DISTANCE
        distance = up_x - in_x
        
        // PRE SET VIEW ALPHA
        signUpView.alpha = 0
        signInView.alpha = 1
        
    }
    
    func signInPressed() {
        
        if underLine_currentPosition == 1 {
            
            endEditing()
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: [], animations: {
                
                self.underLine.transform = CGAffineTransformMakeTranslation(0, 0)
                self.signInView.alpha = 1
                self.signUpView.alpha = 0
                
                
                }, completion: { _ in
                    
                    self.underLine_currentPosition = 0
                    
            })
            
        }
        
    }
    
    func signUpPressed() {
        
        if underLine_currentPosition == 0 {
            
            endEditing()
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: [], animations: {
                
                self.underLine.transform = CGAffineTransformMakeTranslation(self.distance, 0)
                self.signUpView.alpha = 1
                self.signInView.alpha = 0
                
                }, completion: { _ in
                    
                    self.underLine_currentPosition = 1
                    
            })
            
        }
        
    }
    
    func setupUserInteraction() {
        
        // TAP TO RESIGN TEXT FIELDS
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        self.view.addGestureRecognizer(tap)
        
    }
    
    func endEditing() {
        
        if in_email.isFirstResponder() {
            
            in_email.resignFirstResponder()
            
        }else if in_password.isFirstResponder() {
            
            in_password.resignFirstResponder()
            
        }else if up_email.isFirstResponder() {
            
            up_email.resignFirstResponder()
            
        }else if up_password.isFirstResponder() {
            
            up_password.resignFirstResponder()
            
        }else {
            
            up_confirmPassword.resignFirstResponder()
            
        }
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        var lineToDraw = in_email_line
        
        if textField == in_password {
            
            lineToDraw = in_password_line
            
        }else if textField == up_email {
            
            lineToDraw = up_email_line
            
        }else if textField == up_password {
            
            lineToDraw = up_password_line
            
        }else if textField == up_confirmPassword {
            
            lineToDraw = up_confirmPassword_line
            
        }
        
        if textField.text == "" {
            
            UIView.animateWithDuration(0.3) {
                
                lineToDraw.alpha = 1
                
            }
            
        }
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        var lineToDraw = in_email_line
        
        if textField == in_password {
            
            lineToDraw = in_password_line
            
        }else if textField == up_email {
            
            lineToDraw = up_email_line
            
        }else if textField == up_password {
            
            lineToDraw = up_password_line
            
        }else if textField == up_confirmPassword {
            
            lineToDraw = up_confirmPassword_line
            
        }
        
        if textField.text == "" {
            
            UIView.animateWithDuration(0.3) {
                
                lineToDraw.alpha = 0.5
                
            }
            
        }
        
    }
    
}
