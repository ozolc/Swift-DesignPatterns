//
//  CatalogInteractor.swift
//  Builder
//
//  Created by Maksim Nosov on 09/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

protocol Interactor {
    init(presenter: Presenter)
}

class CatalogInteractor: Interactor {
    var presenter: Presenter!
    
    // "Бизнес логика"
    
    required init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    
}
