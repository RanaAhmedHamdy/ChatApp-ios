//
//  ChannelVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/26/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImage: CircleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 70
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataChanged(_:)), name: NOTF_DATA_CHANGE_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUserInfo()
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.logged_in {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @IBAction func unwindtoChannelVC(segue: UIStoryboardSegue) {
        
    }
    
    @objc func userDataChanged(_ notif: Notification) {
        setUserInfo()
    }
    
    func setUserInfo() {
        if AuthService.instance.logged_in {
            loginBtn.setTitle(DataService.instance.userName, for: .normal)
            userImage.image = UIImage(named: DataService.instance.avatarName)
            userImage.backgroundColor = DataService.instance.returnUIColor(components: DataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }
}
