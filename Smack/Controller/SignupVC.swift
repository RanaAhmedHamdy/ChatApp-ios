//
//  SignupVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/26/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if DataService.instance.avatarName != "" {
            userImage.image = UIImage(named: DataService.instance.avatarName)
            self.avatarName = DataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            } else if avatarName.contains("dark") && bgColor == nil {
                userImage.backgroundColor = UIColor.white
            }
        }
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else {return}
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if(success) {
                print("registered user!")
                
                AuthService.instance.login(email: email, password: pass, completion: { (successful_login) in
                    if(successful_login) {
                        print("logged in ", AuthService.instance.authToken)
                        
                        AuthService.instance.createUser(userName: name, userEmail: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(DataService.instance.userName, DataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL_VC, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any) {
    }
    
    @IBAction func generateBGColorBtnPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        self.userImage.backgroundColor = bgColor
    }
}
