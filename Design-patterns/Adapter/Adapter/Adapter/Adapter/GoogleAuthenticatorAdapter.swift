//
//  GoogleAuthenticatorAdapter.swift
//  Adapter
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class GoogleAuthenticatorAdapter: AuthenticationService {
    
    private var authenticator = GoogleAuthenticator()
    
    public func login(email: String,
                      password: String,
                      success: @escaping (User, Token) -> Void,
                      failure: @escaping (Error?) -> Void) {
        
        self.authenticator.login(email: email,
                                 password: password) { (currentUser, error) in
                                    guard let currentUser = currentUser else {
                                        failure(error)
                                        return
                                    }
                                    
                                    let user = User(email: currentUser.email, password: currentUser.password)
                                    let token = Token(value: currentUser.token)
                                    success(user, token)
                                    
        }
    }
}
