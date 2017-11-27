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
}
