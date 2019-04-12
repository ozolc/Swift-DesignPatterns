//
//  ViewController.swift
//  Adapter
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var authService: AuthenticationService = TwitterAuthenticatorAdapter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUser(email: "user@example.com", password: "!er123456passW")
    }

    func createUser(email: String, password: String) {
        authService.login(email: email, password: email, success: { (user, token) in
            print("Auth succeeded: \(user.email), \(token.value)")
            
        }) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

}

