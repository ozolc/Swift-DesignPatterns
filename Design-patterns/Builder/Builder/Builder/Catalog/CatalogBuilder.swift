//
//  CatalogBuilder.swift
//  Builder
//
//  Created by Maksim Nosov on 09/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class CatalogBuilder: ModuleBuilder {
    var title: String?
    
    func setTitle(_ title: String) -> CatalogBuilder {
        self.title = title
        return self
    }
    
    func build() -> UIViewController {
        guard let title = title else { fatalError("Вы должны добавить title.")}
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor(presenter: presenter)
        let controller = CatalogViewController(title: title, interactor: interactor)
        presenter.viewController = controller
        
        return controller
    }
    
    
}
