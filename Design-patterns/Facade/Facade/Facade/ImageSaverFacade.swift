//
//  ImageSaverFacade.swift
//  Facade
//
//  Created by Maksim Nosov on 16/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ImageSaverFacade {
    private let pathProvider = PathProvier()
    private let dataProvider = ImageDataProvider()
    
    public func save(image: UIImage, type: ImageType, fileName: String, overwrite: Bool) throws {
        let destinationURL = try pathProvider.createDestinationPath(fileName: fileName)
        let imageData = try dataProvider.data(from: image, type: type)
        let writeOptions: Data.WritingOptions = overwrite ? (.atomic) : (.withoutOverwriting)
        try imageData.write(to: destinationURL, options: writeOptions)
    }
}
