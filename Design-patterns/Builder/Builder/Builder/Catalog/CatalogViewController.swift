//
//  CatalogViewController.swift
//  Builder
//
//  Created by Maksim Nosov on 09/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {
    let interactor: Interactor!
    
    init(title: String, interactor: Interactor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue

    }

}
