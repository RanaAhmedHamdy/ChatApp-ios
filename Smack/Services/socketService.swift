//
//  socketService.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/28/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit
import SocketIO

class socketService: NSObject {
    static let instance = socketService()
    
    override init() {
        super.init()
    }
    
    let socket = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress]).defaultSocket
   
    func establishConnection() {
        socket.connect()
    }
    
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping completionHandler){
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping completionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let name = dataArray[0] as? String else {return}
            guard let desc = dataArray[1] as? String else {return}
            guard let id = dataArray[2] as? String else {return}
            
            let channel = Channel(channelTitle: name, channelDescription: desc, channelID: id)
            MessageService.instance.channels.append(channel)
            completion(true)
        }
    }
}
