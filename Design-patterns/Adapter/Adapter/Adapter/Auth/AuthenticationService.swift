//
//  AuthenticationService.swift
//  Adapter
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

public struct User {
    public let email: String
    public let password: String
}

public struct Token {
    public let value: String
}

public protocol AuthenticationService {
    func login(email: String,
               password: String,
               success: @escaping (User, Token) -> Void,
               failure: @escaping(Error?) -> Void)
}
