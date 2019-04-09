//
//  CatalogPresenter.swift
//  Builder
//
//  Created by Maksim Nosov on 09/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

protocol Presenter {
    var messageInfo: String { get }
}

class CatalogPresenter: Presenter {
    weak var viewController: CatalogViewController?
    
    var messageInfo = "В этом классе можно создавать viewModel для представления"
}
