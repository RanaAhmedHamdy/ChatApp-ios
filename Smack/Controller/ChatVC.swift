//
//  ChatVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/26/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.logged_in {
            AuthService.instance.getUserDataByEmail(completion: { (success) in
                if success {
                    //NotificationCenter.default.post(name: NOTF_DATA_CHANGE_DID_CHANGE, object: nil)
                }
            })
        }
        
        MessageService.instance.getAllChannels { (success) in
            
        }
    }
}
