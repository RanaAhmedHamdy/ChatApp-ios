//
//  DataService.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/27/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    public private(set) var id = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    public private(set) var userName = ""
    public private(set) var userEmail = ""
    
    func setUserData(id: String, avatarName: String, avatarColor: String, userName: String, userEmail: String) {
        self.id = id
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        self.userName = userName
        self.userEmail = userEmail
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet (charactersIn: "[], ")
        let comma = CharacterSet (charactersIn: ",")
        
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a: NSString?

        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else { return defaultColor }
        guard let gUnwrapped = g else { return defaultColor }
        guard let bUnwrapped = b else { return defaultColor }
        guard let aUnwrapped = a else { return defaultColor }
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
    
    func logout() {
        id = ""
        avatarName = ""
        avatarColor = ""
        userEmail = ""
        userName = ""
        
        AuthService.instance.logged_in = false
        AuthService.instance.authToken = ""
        AuthService.instance.userEmail = ""
    }
}
