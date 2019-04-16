//
//  ViewController.swift
//  Facade
//
//  Created by Maksim Nosov on 16/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

enum ImageSaverError: Error {
    case couldNotCreateDestinationPath
    case couldNotCreateJPEGDataFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveImageDestinationPath
}

enum ImageType {
    case png
    case jpeg(compressionQuality: CGFloat)
}

class ViewController: UIViewController {
    let imageSaver = ImageSaverFacade()
    let image = #imageLiteral(resourceName: "image")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try imageSaver.save(image: image, type: .png, fileName: "my_file_name", overwrite: true)
        } catch {
            print(error)
        }
    }


}

