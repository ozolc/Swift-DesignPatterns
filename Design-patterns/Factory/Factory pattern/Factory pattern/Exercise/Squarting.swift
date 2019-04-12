//
//  Squarting.swift
//  Factory pattern
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class Squarting: Exercise {
    var name: String = "Приседания"
    
    var type: String = "Упражение для ног"
    
    func start() {
        print("Начать приседания")
    }
    
    func stop() {
        print("Закончить приседания")
    }
    
    
}
