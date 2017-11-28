//
//  ChannelVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/26/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    @IBAction func addChannelBtnPressed(_ sender: Any) {
        if AuthService.instance.logged_in {
            let createChannelVC = CreateChannelVC()
            createChannelVC.modalPresentationStyle = .custom
            present(createChannelVC, animated: true, completion: nil)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.item]
            cell.configureCell(channel: channel)
            return cell
        }
        return ChannelCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
}
