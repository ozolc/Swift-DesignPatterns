//
//  ViewController.swift
//  Builder
//
//  Created by Maksim Nosov on 09/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func catalogButtonDidTapped(_ sender: Any) {
        let controller = CatalogBuilder().setTitle("Catalog").build()
        self.present(controller, animated: true, completion: nil)
    }
    
}

