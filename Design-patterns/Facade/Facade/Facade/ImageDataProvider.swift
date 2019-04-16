//
//  ImageDataProvider.swift
//  Facade
//
//  Created by Maksim Nosov on 16/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ImageDataProvider {
    public func data(from image: UIImage, type: ImageType) throws -> Data {
        switch type {
        case .jpeg(let compressionQuality):
            return try jpegData(from: image, compressionQuality: compressionQuality)
        case .png:
            return try pngData(from: image)
        }
    }
    
    private func pngData(from image: UIImage) throws -> Data {
        guard let imageData = image.pngData() else {
            throw ImageSaverError.couldNotCreatePNGDataFromImage
        }
        return imageData
    }
    
    private func jpegData(from image: UIImage, compressionQuality: CGFloat) throws -> Data {
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else {
            throw ImageSaverError.couldNotCreateJPEGDataFromImage
        }
        return imageData
    }
}
