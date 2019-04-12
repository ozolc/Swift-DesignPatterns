//
//  SwingPress.swift
//  Factory pattern
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class SwingPress: Exercise {
    var name: String = "Жим штанги"
    
    var type: String = "Упражение для груди"
    
    func start() {
        print("Начинаем упражение для груди")
    }
    
    func stop() {
        print("Заканчиваем упражение для груди")
    }
    
    
}
