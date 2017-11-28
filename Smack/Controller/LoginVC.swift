//
//  LoginVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/26/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        spinner.isHidden = true
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let userName = usernameTxt.text, usernameTxt.text != ""  else {return}
        guard let password = passwordTxt.text, passwordTxt.text != ""  else {return}
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        AuthService.instance.login(email: userName, password: password) { (success) in
            if success {
                AuthService.instance.getUserDataByEmail(completion: { (successGettingUserData) in
                    if successGettingUserData {
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        
                        self.dismiss(animated: true, completion: nil)
                        NotificationCenter.default.post(name: NOTF_DATA_CHANGE_DID_CHANGE, object: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_SIGN_UP, sender: nil)
    }
    
    @IBAction func clostBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
