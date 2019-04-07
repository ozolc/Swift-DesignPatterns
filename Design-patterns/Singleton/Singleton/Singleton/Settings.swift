//
//  Settings.swift
//  Singleton
//
//  Created by Maksim Nosov on 30/03/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class Settings {
    static let shared = Settings()
    
    var colorStyle = UIColor.white
    var volumeLevel: Float = 1.0
    
    private init() { }
    
}
