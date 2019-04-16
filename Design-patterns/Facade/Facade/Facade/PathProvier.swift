//
//  PathProvier.swift
//  Facade
//
//  Created by Maksim Nosov on 16/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class PathProvier {
    func createDestinationPath(fileName: String) throws -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw ImageSaverError.couldNotCreateDestinationPath
        }
        let destinationPath = path.appendingPathComponent("\(fileName)")
        print(destinationPath)
        return destinationPath
    }
}
