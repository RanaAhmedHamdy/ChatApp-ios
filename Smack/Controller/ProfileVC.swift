//
//  ProfileVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupview()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.handleTap))
        bgView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        DataService.instance.logout()
        NotificationCenter.default.post(name: NOTF_DATA_CHANGE_DID_CHANGE, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupview() {
        userName.text = DataService.instance.userName
        userEmail.text = DataService.instance.userEmail
        
        userImage.image = UIImage(named: DataService.instance.avatarName)
        userImage.backgroundColor = DataService.instance.returnUIColor(components: DataService.instance.avatarColor)
    }
    
}
