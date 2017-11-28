//
//  AuthService.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/27/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var logged_in: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        
        set {
            defaults.setValue(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: AUTH_TOKEN) as! String
        }
        
        set {
            defaults.setValue(newValue, forKey: AUTH_TOKEN)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        
        set {
            defaults.setValue(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping completionHandler) {
        let lowercaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping completionHandler) {
        let lowercaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                /*if let json = response.result.value as? Dictionary<String, Any> {
                    if let email = json["user"] as? String {
                        self.userEmail = email
                    }
                    
                    if let token = json["token"] as? String {
                        self.authToken = token
                    }
                    
                    self.logged_in = true
                }*/
                //using swiftyJSON
                guard let data = response.data else {return}
                let json = try! JSON(data: data)
                let email = json["user"].stringValue
                self.userEmail = email
                
                let token = json["token"].stringValue
                self.authToken = token
                
                self.logged_in = true
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(userName: String, userEmail: String, avatarName: String, avatarColor: String,
                    completion: @escaping completionHandler) {
        let lowercaseEmail = userEmail.lowercased()
        
        let header = [
            "Authorization": "Bearer \(authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "name": userName,
            "email": lowercaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL_ADD_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getUserDataByEmail(completion: @escaping completionHandler) {
        let header = [
            "Authorization": "Bearer \(authToken)",
        ]
        
        Alamofire.request("\(URL_GET_USER_DATA_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserInfo(data: Data) {
        let json = try! JSON(data: data)
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        let avatarName = json["avatarName"].stringValue
        let avatarColor = json["avatarColor"].stringValue
        let id = json["_id"].stringValue
        
        DataService.instance.setUserData(id: id, avatarName: avatarName, avatarColor: avatarColor, userName: name, userEmail: email)
    }
}
