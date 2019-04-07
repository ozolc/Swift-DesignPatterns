//
//  ViewController.swift
//  Singleton
//
//  Created by Maksim Nosov on 30/03/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = Settings.shared.volumeLevel
        print(s)
    }


}

