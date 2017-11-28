//
//  Constants.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/26/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import Foundation

typealias completionHandler = (_ Success: Bool) -> ()

//segues
let TO_LOGIN = "toLoginVC"
let TO_SIGN_UP = "toSignup"
let UNWIND_TO_CHANNEL_VC = "unwindToChannelVC"

//user defaults
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let AUTH_TOKEN = "token"

//url constants
let BASE_URL = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_ADD_USER = "\(BASE_URL)user/add"
let URL_GET_USER_DATA_BY_EMAIL = "\(BASE_URL)/user/byEmail/"

//notification
let NOTF_DATA_CHANGE_DID_CHANGE = Notification.Name("notifUserDataChanged")
