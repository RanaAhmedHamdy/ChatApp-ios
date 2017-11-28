//
//  CreateChannelVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class CreateChannelVC: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var channelDescriptionTxt: UITextField!
    @IBOutlet weak var channelNameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateChannelVC.handleTap))
        bgView.addGestureRecognizer(tap)
        
        self.spinner.isHidden = true
    }
    
    @objc func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelBtnPressed(_ sender: Any) {
        guard let channelName = channelNameTxt.text, channelNameTxt.text != ""  else {return}
        guard let channelDescription = channelDescriptionTxt.text, channelDescriptionTxt.text != ""  else {return}
        
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        
        MessageService.instance.createChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            self.spinner.isHidden = true
            self.spinner.stopAnimating()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
