//
//  MessageService.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func getAllChannels(completion: @escaping completionHandler) {
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
        ]
        
        Alamofire.request(URL_ALL_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                if let json = try! JSON(data: data).array {
                    for item in json {
                        let channelDescription = item["description"].stringValue
                        let channelName = item["name"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = Channel(channelTitle: channelName, channelDescription: channelDescription, channelID: id)
                        
                        self.channels.append(channel)
                    }
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
