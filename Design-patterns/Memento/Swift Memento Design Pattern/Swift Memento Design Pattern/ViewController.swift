//
//  ViewController.swift
//  Swift Memento Design Pattern
//
//  Created by Maksim Nosov on 08/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Called when "Save User" button is tapped. Stores
    // "User" class instance properties to UserDefaults
    // based on stateName property value of "userKey" (but
    // use whatever lights your fire).
    @IBAction func saveUserTapped(_ sender: Any) {
        if firstNameTextField.text != "" &&
        lastNameTextField.text != "" &&
            ageTextField.text != "" {
            let user = User(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, age: ageTextField.text!, stateName: "userKey")
            user.show()
        }
    } // end func saveUserTapped
    
    // Called when "Restore User" button is tapped. Retrieves
    // "User" class instance properties from UserDefaults
    // based on stateName property value of "userKey," if
    // a key/value pair with key "userKey" exists.
    @IBAction func restoreUserTapped(_ sender: Any) {
        let user = User(stateName: "userKey")
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        ageTextField.text = user.age
        user.show()
    }
    
} // end class ViewController

