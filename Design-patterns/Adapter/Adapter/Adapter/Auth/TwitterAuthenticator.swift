//
//  TwitterAuthenticator.swift
//  Adapter
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

public struct TwitterUser {
    public var email: String
    public var password: String
    public var token: String
}

public class TwitterAuthenticator {
    public func login(email: String,
                      password: String,
                      completion: @escaping (TwitterUser?, Error?) -> Void) {
        
        let token = "twitter-token"
        let user = TwitterUser(email: email,
                              password: password,
                              token: token)
        completion(user, nil)
    }
}
